from Ares_game import AresGame
from utils import distance
import heapq
from timeit import default_timer as timer
import sys

def heristic(state_info, stones_weight):
    min_distance = float('inf')
    total_distance = 0

    for stone in state_info['stones']:
        distance_to_stone = distance(state_info['character'], stone)
        if distance_to_stone < min_distance:
            min_distance = distance_to_stone

    for idx, stone in enumerate(state_info['stones']):
        if stone in state_info['switches']:
            continue
        min_switch_distance = float('inf')
        for switch in state_info['switches']:
            # if switch in state_info['stones']:
            #     continue
            switch_distance = distance(stone, switch) * int(stones_weight[idx])
            if switch_distance < min_switch_distance:
                min_switch_distance = switch_distance
        total_distance += min_switch_distance

    return min_distance + total_distance
    
def generate_output(algorithm_name, steps, total_weight, nodes_generated, time_used, memory_used, path):
    output = f"{algorithm_name}\n"
    output += f"Steps: {steps}, Weight: {total_weight}, Nodes: {nodes_generated}, "
    output += f"Time (ms): {time_used * 1000:.2f}, Memory (MB): {memory_used:.2f}\n"
    output += path
    return output

def play_game(map_path):
    game = AresGame()
    game.load_map(map_path)
    states_in = []
    states_out = set()
    first_state = game.get_map()
    stones_weight = game.weights
    states_out.add(str(first_state))
    enum = 0
    for move, _, state_info, weight in game.allAvailableMoves():
        heapq.heappush(states_in, (weight + heristic(state_info, stones_weight) + 1, enum, 1 + weight, state_info, weight, move))
        enum += 1
    is_win = False
    path, weight = None, None

    while len(states_in) > 0 and not is_win:
        h, _, c, state, g, p = heapq.heappop(states_in)
        if str(state) in states_out:
            continue
        states_out.add(str(state))
        game.update_map(state)
        if game.is_win():
            is_win = True
            weight = g
            path = p
            break
        for move, _, state_info, w in game.allAvailableMoves():
            if str(state_info) not in states_out:
                heapq.heappush(states_in, (c + w + heristic(state_info, stones_weight) + 1, enum, c + w + 1, state_info, g + w, p + move))
                enum += 1

    step = len(path) if path is not None else 0
    nodes_generated = len(states_in) + len(states_out)
    memory = (sys.getsizeof(states_in) + sys.getsizeof(states_out)) / (1024 ** 2)

    if is_win:
        return step, weight, nodes_generated, memory, path
    return  0, 0, nodes_generated, memory, 'No solution found'

def play_map(map_path):
    start = timer()
    step, weight, total_node, memory, path = play_game(map_path)
    end = timer()
    output = generate_output("A*", step, weight, total_node, end - start, memory, path)
    return output

    
if __name__ == '__main__':
    output = play_map('inputs/input-01.txt')
    print(output)
    
