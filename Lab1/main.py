from BFS import play_map as bfs
from IDDFS import play_map as dfs
from UCS import play_map as ucs
from Astar import play_map as astar
from tqdm import tqdm
import os

def solve_map(map_path, algorithm):
    """Giải bản đồ bằng thuật toán được chọn."""
    if algorithm == 'BFS':
        output = bfs(map_path)
    elif algorithm == 'DFS':
        output = dfs(map_path)
    elif algorithm == 'UCS':
        output = ucs(map_path)
    elif algorithm == 'A*':
        output = astar(map_path)
    else:
        output = 'Algorithm not found'
        print('Algorithm not found')
    return output

def create_output(map_path, output_path):
    """Tạo kết quả cho bản đồ."""
    list_algorithm = ['BFS', 'DFS', 'UCS', 'A*']
    with open(output_path, 'w', encoding='utf-8') as f:
        for algorithm in tqdm(list_algorithm):
            try:
                output = solve_map(map_path, algorithm)
                if output:
                    f.write(output)
                    f.write('\n')
                else:
                    f.write('No solution found.')
                    f.write('\n')
            except Exception as e:
                print(e)
                f.write('No solution found.')
                f.write('\n')

if __name__ == '__main__':
    inputs_folder = 'inputs'
    outputs_folder = 'outputs'
    for map_file in os.listdir(inputs_folder):
        if map_file.endswith('.txt'):
            print(f'Solving {map_file}...')
            map_path = os.path.join(inputs_folder, map_file)
            output_path = os.path.join(outputs_folder, map_file.replace('input', 'output'))
            create_output(map_path, output_path)