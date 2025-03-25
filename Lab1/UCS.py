import heapq
import time
import psutil
import os
import sys

MOVE = 1

def read_file(file_name):
    grid = []
    with open(file_name, 'r') as file:
        stone_weights = list(map(int, file.readline().split()))
        for line in file:
            grid.append(list(line))
    return grid, stone_weights

def transfer(grid):
    start = ()
    stones = []
    switches = []
    posWall = []

    for i in range(len(grid)):
        for j in range(len(grid[i])):
            if grid[i][j] == '@':
                start = (i, j)
            elif grid[i][j] == '$':
                stones.append((i, j))
            elif grid[i][j] == '.':
                switches.append((i, j))
            elif grid[i][j] == '+':
                start = (i, j)
                switches.append((i, j))
            elif grid[i][j] == '*':
                stones.append((i, j))
                switches.append((i, j))
            elif grid[i][j] == '#':
                posWall.append((i, j))
    posWall = tuple(tuple(x) for x in posWall)
    return start, stones, switches, posWall

def generate_output(algorithm_name, steps, total_weight, nodes_generated, time_used, memory_used, path):
    output = f"{algorithm_name}\n"
    output += f"Steps: {steps}, Weight: {total_weight}, Nodes: {nodes_generated}, "
    output += f"Time (ms): {time_used * 1000:.2f}, Memory (MB): {memory_used:.2f}\n"
    output += path
    return output

def save_output(filename, output):
    with open(filename, 'w') as file:
        file.write(output)
    print(output)

def isLegalAction(action, posPlayer, posStone, posWall):
    xPlayer, yPlayer = posPlayer
    if action[-1].isupper():
        x1, y1 = xPlayer + 2 * action[0], yPlayer + 2 * action[1]
    else:
        x1, y1 = xPlayer + action[0], yPlayer + action[1]
    return (x1, y1) not in posStone and (x1, y1) not in posWall

def legalActions(posPlayer, posStone, posWall):
    allActions = [[-1, 0, 'u', 'U'], [1, 0, 'd', 'D'], [0, -1, 'l', 'L'], [0, 1, 'r', 'R']]
    xPlayer, yPlayer = posPlayer
    legalActions = []
    for action in allActions:
        x1, y1 = xPlayer + action[0], yPlayer + action[1]
        if (x1, y1) in posStone:
            action.pop(2)
        else:
            action.pop(3)
        if isLegalAction(action, posPlayer, posStone, posWall):
            legalActions.append(action)
    return tuple(tuple(x) for x in legalActions)

def updateState(posPlayer, posStone, stone_weights, action):
    xPlayer, yPlayer = posPlayer
    newPosPlayer = [xPlayer + action[0], yPlayer + action[1]]
    posStone = [list(x) for x in posStone]
    if action[-1].isupper():
        idx = posStone.index(newPosPlayer)
        weight = stone_weights[idx]
        posStone[idx] = xPlayer + 2 * action[0], yPlayer + 2 * action[1]
    else:
        weight = MOVE
    posStone = tuple(tuple(x) for x in posStone)
    newPosPlayer = tuple(newPosPlayer)
    return newPosPlayer, posStone, weight


class UCS:
    def __init__(self, grid, start, stones, switches, stone_weights, posWall):
        self.grid = grid
        self.start = start
        self.stones = stones
        self.switches = switches
        self.stone_weights = stone_weights
        self.posWall = posWall
        self.node_count = 0
        self.pq = []
        self.explored = set()

    def ucs(self):
        startState = (self.start, tuple(tuple(x) for x in self.stones))
        heapq.heappush(self.pq, (0, '', [startState], 0))
        while self.pq:
            # lấy các giá trị trong heap
            current_cost, node_action, node, current_weight = heapq.heappop(self.pq)
            self.node_count += 1
            current_state = node[-1]
            posPlayer, posStone = current_state

            if all(stone in self.switches for stone in posStone):
                return node_action, current_weight

            # Kiểm tra trạng thái hiện tại đã được thăm chưa
            if current_state not in self.explored:
                self.explored.add(current_state)
                for act in legalActions(posPlayer, posStone, self.posWall):
                    newPosPlayer, newPosStone, weight = updateState(posPlayer, posStone, self.stone_weights, act)
                    total_cost = current_cost + weight
                    total_weight = current_weight
                    if act[-1].isupper():
                        total_weight += weight
                        total_cost += MOVE
                    heapq.heappush(self.pq, (total_cost, node_action + act[-1], node + [(newPosPlayer, newPosStone)], total_weight))

        return None, None

def play_map(map_path):
    grid, stone_weights = read_file(map_path)
    start, stones, switches, posWall = transfer(grid)

    ucs_solver = UCS(grid, start, stones, switches, stone_weights, posWall)
    start_time = time.time()
    result, weight = ucs_solver.ucs()
    memory_used = (sys.getsizeof(ucs_solver.pq) + sys.getsizeof(ucs_solver.explored)) / (1024 ** 2)
    end_time = time.time()
    exec_time = end_time - start_time

    if result:
        steps = len(result)
        expanded_node = ucs_solver.node_count
        output = generate_output('UCS', steps, weight, expanded_node, exec_time, memory_used, result)
        return output
    else:
        steps = 0
        expanded_node = ucs_solver.node_count
        output = generate_output('UCS', steps, weight, expanded_node, exec_time, memory_used, 'No solution found')
        return output

if __name__ == '__main__':
    print(play_map('inputs/input-01.txt'))
