from Ares_game import AresGame
from timeit import default_timer as timer
import sys
from collections import deque
import os
from time import sleep
    
def generate_output(algorithm_name, steps, total_weight, nodes_generated, time_used, memory_used, path):
    output = f"{algorithm_name}\n"
    output += f"Steps: {steps}, Weight: {total_weight}, Nodes: {nodes_generated}, "
    output += f"Time (ms): {time_used * 1000:.2f}, Memory (MB): {memory_used:.2f}\n"
    output += path
    return output

def play_game(map_path):
    game = AresGame()
    game.load_map(map_path)
    states_in = deque()
    states_out = set()
    first_state = game.get_map()
    states_out.add(str(first_state))
    for move, _, state_info, weight in game.allAvailableMoves():
        states_in.append((state_info, weight, move))
    is_win = False
    path, weight = None, None
    k=0
    while len(states_in) > 0 and not is_win:
        state, g, p = states_in.popleft()
        if str(state) in states_out:
            # print(k)
            # k+=1
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
                states_in.append((state_info, g + w, p + move))

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
    output = generate_output("BFS", step, weight, total_node, end - start, memory, path)
    return output

    
if __name__ == '__main__':
    output = play_map('inputs/input-01.txt')
    print(output)
    
