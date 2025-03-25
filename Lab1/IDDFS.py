import sys
import collections
import numpy as np
import time
import psutil
from Ares_game import getWeight

posWalls = None
posSwitches = None

exploredSet = None
frontier = None

# Đọc file input và trả ra ma trận và cân nặng của các tảng đá
def readInputFromFile(filename):    
    with open(filename, 'r') as f:
        weights = list(map(int, f.readline().split()))  
        matrix = f.readlines()  
    return weights, matrix


#Chuyển ma trận dạng string về ma trận gốm các số với quy ước
def transfer(matrix):
    # Thay thế các kí tự xuống dòng thành khoảng trắng
    matrix = [x.replace('\n','') for x in matrix]
    # Biến các dòng trong ma trận thành chuỗi được phân cách bằng dấu phẩy
    matrix = [','.join(matrix[i]) for i in range(len(matrix))]
    # Biến các dòng từ chuỗi thành danh sách các phần tử
    matrix = [x.split(',') for x in matrix]
    # Tìm số lượng cột
    maxColsNum = max([len(x) for x in matrix])
    # Duyệt từng phần tử trong ma trận và chuyển chúng từ kí tự thành số
    # theo quy ước
    for irow in range(len(matrix)):
        for icol in range(len(matrix[irow])):
            if matrix[irow][icol] == ' ': matrix[irow][icol] = 0   # Khoảng trống
            elif matrix[irow][icol] == '#': matrix[irow][icol] = 1 # Tường
            elif matrix[irow][icol] == '@': matrix[irow][icol] = 2 # Ares (agent)
            elif matrix[irow][icol] == '$': matrix[irow][icol] = 3 # Viên đá
            elif matrix[irow][icol] == '.': matrix[irow][icol] = 4 # Vị trí switch
            elif matrix[irow][icol] == '*': matrix[irow][icol] = 5 # Viên đá nằm trên switch
            elif matrix[irow][icol] == '+': matrix[irow][icol] = 6 # Ares đứng trên switch
        colsNum = len(matrix[irow])
        # Nếu hàng nào không đủ tạo thành một ma trận thì thêm kí tự
        # tương ứng với tường vào hàng
        if colsNum < maxColsNum:
            matrix[irow].extend([1 for _ in range(maxColsNum - colsNum)]) 
    # Trả về mảng NumPy
    return np.array(matrix)


# Hàm trả về vị trí của Ares
def PositionOfAres(gameState):    
    return tuple(map(int, np.argwhere((gameState == 2) | (gameState == 6))[0]))


# Hàm trả về vị trí các viên đá và cân nặng tương ứng của nó
def PositionOfStones(gameState, weight):
    positions =  tuple(map(tuple,np.argwhere((gameState == 3) | (gameState == 5)))) 
    return tuple(((x, y), z) for (x, y), z in zip(positions, weight))


# Hàm trả về vị trí tường
def PositionOfWalls(gameState):
    return tuple(map(tuple, np.argwhere(gameState == 1))) 


# Hàm trả về vị trí các switch
def PositionOfSwitches(gameState):
    return tuple(map(tuple, np.argwhere((gameState == 4) | (gameState == 5) | (gameState == 6)))) 

    
# Hàm kiểm tra xem đã đạt trạng thái kết thúc chưa
# Tức là các viên đá đều đã được đặt trên switch
def isEndState(posStone):
    positions_in_posStone = [pos[0] for pos in posStone]
    return sorted(positions_in_posStone) == sorted(posSwitches)


# Hàm kiểm tra xem việc di chuyển có hợp lệ không
def isLegalAction(action, posAres, posStone):
    xAres, yAres = posAres
    # Nếu thực hiện di chuyển viên đá
    if action[-1].isupper(): 
        x1, y1 = xAres + 2 * action[0], yAres + 2 * action[1]
    else:   # Nếu chỉ di chuyển Ares
        x1, y1 = xAres + action[0], yAres + action[1]
    positions_in_posStone = [pos[0] for pos in posStone]
    # Kiểm tra xem vị trí sau khi di chuyển có trùng với đá hay tường không
    return (x1, y1) not in positions_in_posStone and (x1, y1) not in posWalls


# Hàm sẽ kiểm tra việc thực hiện di chuyển (có di chuyển đá hay không)
def legalActions(posAres, posStone):
    allActions = [[-1,0,'u','U'],[0,-1,'l','L'],[1,0,'d','D'],[0,1,'r','R']]
    xAres, yAres = posAres
    legalActions = []
    # Xét từng hành động (di chuyển lên, trái, xuống, phải)
    for action in allActions:
        x1, y1 = xAres + action[0], yAres + action[1]
        # Nếu Ares di chuyển vào vị trí viên đá
        if (x1, y1) in [pos[0] for pos in posStone]: 
            action.pop(2)   # Bỏ kí tự chữ thường đi (lấy kí tự in)
        else:
            action.pop(3)   # Bỏ kí tự in (lấy kí tự chữ thường)
        # Nếu kiểm tra việc di chuyển hợp lệ
        # thì thêm hành động vào danh sách sẽ thực hiện
        if isLegalAction(action, posAres, posStone):
            legalActions.append(action)
        else: 
            continue     
    return tuple(map(tuple, legalActions)) 


# Hàm trả về trạng thái mới của Ares và viên đá 
# sau khi thực hiện việc di chuyển
def updateState(posAres, posStone, action):
    # Vị trí ban đầu của Ares
    xAres, yAres = posAres 
    # Vị trí sau khi thực hiện di chuyển
    newPosAres = [xAres + action[0], yAres + action[1]]
    # Chuyển đổi tọa độ đá từ tuple thành list
    posStone = [([x, y], weight) for ((x, y), weight) in posStone]  
    stone_to_move = None
    weight = 0

    # Nếu thực hiện đẩy viên đá
    if action[-1].isupper():  
        # Tìm vị trí của hộp cần đẩy
        for stone in posStone:
            if stone[0] == newPosAres:
                stone_to_move = stone
        if stone_to_move:
            # Lưu lại cân nặng của đá
            weight = stone_to_move[1]
            # Xóa vị trí đá ban đầu khỏi danh sách đá
            posStone.remove(stone_to_move)  
            # Vị trí mới của viên đá sau khi được đẩy
            new_stone_position = [xAres + 2 * action[0], yAres + 2 * action[1]]
            # Viên đá vẫn giữ nguyên cân nặng
            posStone.append([new_stone_position, weight])  
    # Chuyển tọa độ đá từ list về tuple
    posStone = [((x, y), weight) for ([x, y], weight) in posStone]
    posStone = tuple(posStone)
    newPosAres = tuple(newPosAres)
    return newPosAres, posStone, weight

# Hàm thực hiện thuật toán DFS với chiều sâu giới hạn
def depth_limited_dfs(gameState, weight, limit):
    global exploredSet, frontier
    process = psutil.Process()
    nodes_generated = 0
    total_weight = 0
    # Tập các trạng thái đã duyệt
    exploredSet = set()
    # Khởi tạo hàng đợi cho các trạng thái
    frontier = collections.deque([[(PositionOfAres(gameState), PositionOfStones(gameState, weight))]])
    # Khởi tạo danh sách hành động
    actions = [[0]] 

    while frontier:
        node = frontier.pop()
        node_action = actions.pop()
        
        # Kiểm tra xem đã đạt trạng thái kết thúc chưa
        if isEndState(node[-1][1]):
            return node_action[1:], total_weight, nodes_generated
        
        if len(node) <= limit: 
            # Lấy hành động hợp lệ từ trạng thái hiện tại
            for action in legalActions(node[-1][0], node[-1][1]):
                # Cập nhật trạng thái mới của Ares và các viên đá
                newPosAres, newPosStone, move_weight = updateState(node[-1][0], node[-1][1], action)
                nodes_generated += 1
                
                # Nếu trạng thái chưa được duyệt
                if (newPosAres, newPosStone) not in exploredSet:
                    total_weight += move_weight
                    exploredSet.add((newPosAres, newPosStone))      # Thêm trạng thái vào tập đã được duyệt qua
                    frontier.append(node + [(newPosAres, newPosStone)])     # Thêm trạng thái mới vào hàng đợi
                    actions.append(node_action + [action[-1]])      # Thêm hành động vào danh sách hàng đợi

    # Nếu không tìm thấy giải pháp thì trả về None
    return None, total_weight, nodes_generated  

# Hàm thực hiện thuật toán IDDFS với chiều sâu lớn nhất là 100
def iddfs(gameState, weight, map_path, max_depth_threshold=100):
    global exploredSet, frontier
    start_time = time.perf_counter()
    process = psutil.Process()
    depth = 0

    # Duyệt với những chiều sâu chưa quá giới hạn
    while depth <= max_depth_threshold:  
        path, _, nodes_generated = depth_limited_dfs(gameState, weight, depth)
        
        # Nếu tìm thấy lời giải
        if path:
            total_weight = getWeight(map_path, path)
            time_used = time.perf_counter() - start_time
            memory_used = sys.getsizeof(exploredSet) / (1024 * 1024) + sys.getsizeof(frontier) / (1024 * 1024)
            steps = len(path)
            output = generate_output("IDDFS", steps, total_weight, nodes_generated, time_used, memory_used, ''.join(path))
            return output  
        
        # Nếu chưa tìm thấy lời giải
        depth += 1  

    memory_used = sys.getsizeof(exploredSet) / (1024 * 1024) + sys.getsizeof(frontier) / (1024 * 1024)
    # Nếu đã duyệt đến giới hạn độ sâu được thiết lập mà vẫn chưa tìm được
    # lời giải thì trả ra không có lời giải
    return generate_output("IDDFS", 0, 0, nodes_generated, time.perf_counter() - start_time, memory_used, "No solution found") 

def generate_output(algorithm_name, steps, total_weight, nodes_generated, time_used, memory_used, path):
    output = f"{algorithm_name}\n"
    output += f"Steps: {steps}, Weight: {total_weight}, Nodes: {nodes_generated}, "
    output += f"Time (ms): {time_used * 1000:.2f}, Memory (MB): {memory_used:.2f}\n"
    output += path
    return output

def play_map(map_path):
    global posWalls, posSwitches
    weight, matrix = readInputFromFile(map_path)
    gameState = transfer(matrix)
    posWalls = PositionOfWalls(gameState)
    posSwitches = PositionOfSwitches(gameState)
    output = iddfs(gameState, weight, map_path)
    return output

def save_output(filename, output):
    with open(filename, 'w') as file:
        file.write(output)
    print(output)

if __name__ == '__main__':   
    output = play_map('inputs/input-01.txt')
    print(output)
    


