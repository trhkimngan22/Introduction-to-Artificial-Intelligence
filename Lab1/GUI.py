import tkinter as tk
from tkinter import *
from PIL import Image, ImageTk
from Ares_game import AresGame
import os

def load_and_resize_image(image_path, size):
    """Đọc và thay đổi kích thước hình ảnh."""
    image = Image.open(image_path)
    resized_image = image.resize(size, Image.LANCZOS)
    return ImageTk.PhotoImage(resized_image)

class MazeApp:
    def __init__(self, root, map_root='./inputs', outputs_root='./outputs'):
        """Khởi tạo giao diện chính."""
        self.root = root
        self.outputs_root = outputs_root
        self.root.title("Maze Solver with Algorithms")
        self.root.geometry("1000x500")

        self.start_icon = load_and_resize_image("images/start.png", (50, 50))
        self.pause_icon = load_and_resize_image("images/pause.png", (50, 50))
        self.continue_icon = load_and_resize_image("images/continue.png", (50, 50))
        self.reset_icon = load_and_resize_image("images/reset.png", (50, 50))
        self.next_icon = load_and_resize_image("images/next.png", (50, 50))
        self.previous_icon = load_and_resize_image("images/previous.png", (50, 50))
        self.quit_icon = load_and_resize_image("images/quit.png", (50, 50))
        self.reload_icon = load_and_resize_image("images/reload.png", (50, 50))

        self.button = {}

        self.map_root = map_root
        self.mazes = []
        self.current_maze = 0
        self.flag = False

        self.map = [os.path.basename(j).split('.')[0] for j in os.listdir(self.map_root) if j.endswith('.txt')]
        self.map_choose = StringVar(self.root, value=self.map[0])

        self.algorithm_list = ['BFS', 'IDDFS', 'UCS', 'A*']
        self.algorithm_choose = StringVar(self.root, value=self.algorithm_list[0])

        self.images = {}
        self.speed = 1

        self.create_widgets()
        self.load_images((50, 50))

        self.have_resize = False

    def load_images(self, size):
        """Tải và thay đổi kích thước các hình ảnh."""
        self.images = {
            '#': load_and_resize_image("images/wall.png", size),
            ' ': load_and_resize_image("images/free.png", size),
            '@': load_and_resize_image("images/ares.png", size),
            '$': load_and_resize_image("images/stone.png", size),
            '.': load_and_resize_image("images/switch.png", size),
            '*': load_and_resize_image("images/stone_switch.png", size),
            '+': load_and_resize_image("images/ares_switch.png", size),
        }

    def create_widgets(self):
        """Tạo các widget trong giao diện."""
        main_frame = tk.Frame(self.root)
        main_frame.pack(fill="both", expand=True)

        left_frame = tk.Frame(main_frame)
        left_frame.pack(side="left", fill="both", expand=True, padx=10, pady=10)

        self.canvas = tk.Canvas(left_frame, bg="white")
        self.canvas.pack(fill="both", expand=True)
        self.canvas.bind("<Configure>", self.on_resize)

        right_frame = tk.Frame(main_frame)
        right_frame.pack(side="right", fill="y", padx=10, pady=10)

        tk.Label(right_frame, text="Maze Solver", font=("Arial", 24)).pack(pady=10)

        control_frame = tk.Frame(right_frame)
        control_frame.pack(pady=10)

        buttons = [
            ("Continue", self.switch_click, self.continue_icon),
            ("Reset", self.reset_maze, self.reset_icon),
            ("Quit", self.root.quit, self.quit_icon),
            ("Previous", self.previous_step, self.previous_icon),
            ("Next", self.next_step, self.next_icon)
        ]

        for i, (text, command, icon) in enumerate(buttons):
            row, col = divmod(i, 3)
            bt = tk.Button(control_frame, text=text, image=icon, command=command)
            self.button[text] = bt
            bt.grid(row=row, column=col, padx=5, pady=5)

        speed_button = tk.Button(control_frame, text=f'x{self.speed}', command=self.change_speed, font=("Arial", 16))
        self.button['Speed'] = speed_button
        speed_button.grid(row=1, column=2, columnspan=2, padx=5, pady=5, ipadx=8, ipady=8)

        option_frame = tk.Frame(right_frame)
        option_frame.pack(pady=10)

        tk.OptionMenu(option_frame, self.map_choose, *self.map).pack(fill="x", pady=5)
        tk.OptionMenu(option_frame, self.algorithm_choose, *self.algorithm_list).pack(fill="x", pady=5)
        tk.Button(option_frame, text="Reload", command=self.reload_map).pack(fill="x", pady=5)

        self.info_textbox = tk.Text(right_frame, height=7, width=30)
        self.info_textbox.pack(pady=5)

    def on_resize(self, event):
        """Cập nhật canvas và kích thước hình ảnh khi thay đổi kích thước cửa sổ."""
        self.have_resize = True
        if self.mazes:
            l = max(len(self.mazes[self.current_maze][1]), len(self.mazes[self.current_maze][1][0]))
            z = min(self.canvas.winfo_width(), self.canvas.winfo_height())
            self.w, self.h = z // l, z // l
            self.load_images((self.w, self.h))
            self.draw_maze(self.mazes[self.current_maze][1])

    def draw_maze(self, maze):
        """Vẽ maze lên canvas với kích thước mới."""
        self.canvas.delete("all")
        if self.have_resize:
            l = max(len(maze), len(maze[0]))
            z = min(self.canvas.winfo_width(), self.canvas.winfo_height())
            self.w, self.h = z // l, z // l
            self.load_images((self.w, self.h))
            self.have_resize = False
        w_padding = (self.canvas.winfo_width() - len(maze[0]) * self.w) // 2
        h_padding = (self.canvas.winfo_height() - len(maze) * self.h) // 2
        for y, row in enumerate(maze):
            for x, cell in enumerate(row):
                self.canvas.create_image(x * self.w + w_padding, y * self.h + h_padding, image=self.images[cell], anchor="nw")

        self.info_textbox.delete("1.0", "end")
        info = f'Cost: {len(self.mazes[self.current_maze][0]) + self.mazes[self.current_maze][2]}\nStep: {len(self.mazes[self.current_maze][0])}\nTotal weight: {self.mazes[self.current_maze][2]}\nPath: {self.mazes[self.current_maze][0] if self.have_result else "No solution"}'
        self.info_textbox.insert("end", info)


    def load_result(self, result_file, map_path):
        """Tải kết quả từ file."""
        dict = {}
        self.have_result = False
        try:
            with open(result_file, 'r') as f:
                lines = f.readlines()
                for i in range(0, len(lines)):
                    if lines[i].strip() in self.algorithm_list:
                        dict[lines[i].strip()] = lines[i+2].strip()

            path = dict[self.algorithm_choose.get()]
            if path != 'No solution found':
                self.have_result = True
            elif path == 'No solution found':
                path = ''
            
        except:
            path = ''

        game = AresGame()
        game.load_map(map_path)
        l = max(game.width, game.height)
        self.w, self.h = 500 // l, 500 // l
        self.load_images((self.w, self.h))

        p, total_weight = '', 0
        self.mazes = [(p, game.getMap(), total_weight)]

        for move in path:
            _, weight = game.move(move)
            p += move
            total_weight += weight
            self.mazes.append((p, game.getMap(), total_weight))

        self.current_maze = 0
        self.draw_maze(self.mazes[self.current_maze][1])

    def change_speed(self):
        """Thay đổi tốc độ chạy của thuật toán."""
        if self.speed < 8:
            self.speed = self.speed * 2
        else:
            self.speed = 1

        self.button['Speed'].config(text=f'x{self.speed}')

    def switch_click(self):
        """Chuyển đổi giữa chạy và tạm dừng thuật toán."""
        if self.flag:
            self.button["Continue"].config(image=self.continue_icon)
            self.pause_algorithm()
        else:
            self.button["Continue"].config(image=self.pause_icon)
            self.continue_algorithm()

    def reload_map(self):
        """Tải lại bản đồ và kết quả."""
        self.mazes.clear()
        self.current_maze = 0
        self.flag = False
        self.button["Continue"].config(image=self.continue_icon)
        map_path = os.path.join(self.map_root, self.map_choose.get() + '.txt')
        solution_path = os.path.join(self.outputs_root, self.map_choose.get().replace('input', 'output') + '.txt')
        self.load_result(solution_path, map_path)

    def run_algorithm(self):
        """Chạy thuật toán và hiển thị từng bước."""
        if self.flag and self.current_maze + 1 < len(self.mazes):
            self.current_maze += 1
            self.draw_maze(self.mazes[self.current_maze][1])
            self.root.after(300 // self.speed, self.run_algorithm)
        else:
            self.flag = False
            self.button["Continue"].config(image=self.continue_icon)

    def start_algorithm(self):
        """Bắt đầu thuật toán."""
        if not self.flag:
            self.flag = True
            self.run_algorithm()

    def pause_algorithm(self):
        """Tạm dừng thuật toán."""
        self.flag = False

    def continue_algorithm(self):
        """Tiếp tục thuật toán."""
        if not self.flag:
            self.flag = True
            self.run_algorithm()

    def next_step(self):
        """Bước tiếp theo."""
        if self.current_maze + 1 < len(self.mazes):
            self.current_maze += 1
            self.draw_maze(self.mazes[self.current_maze][1])
            self.flag = False
            self.button["Continue"].config(image=self.continue_icon)

    def previous_step(self):
        """Bước trước đó."""
        if self.current_maze > 0:
            self.current_maze -= 1
            self.draw_maze(self.mazes[self.current_maze][1])
            self.flag = False
            self.button["Continue"].config(image=self.continue_icon)

    def reset_maze(self):
        """Đặt lại maze về trạng thái ban đầu."""
        self.canvas.delete("all")
        self.current_maze = 0
        self.flag = False
        self.button["Continue"].config(image=self.continue_icon)
        self.draw_maze(self.mazes[self.current_maze][1])

def main():
    root = tk.Tk()
    app = MazeApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()
