class AresGame:
    def __init__(self):
        # self.map = None
        self.width = None
        self.height = None
        self.character = None
        self.weights =[]
        self.stones = []
        self.switches = []
        self.walls = []
        self.directions = ['u', 'l', 'd', 'r']

    def load_map(self, map_path):
        self.__init__()
        self.map = []
        with open(map_path, 'r') as f:
            self.weights = f.readline().strip().split()
            self.height = 0
            self.width = 0
            for i, line in enumerate(f):
                row = list(line.strip('\n'))
                self.width = max(self.width, len(row))
                self.height += 1
                for j, cell in enumerate(row):
                    if cell == '@' or cell == '+':
                        self.character = (j, i)
                    if cell == '$' or cell == '*':
                        self.stones.append((j, i))
                    if cell == '.' or cell == '*' or cell == '+':
                        self.switches.append((j, i))
                    if cell == '#':
                        self.walls.append((j, i))

    def update_map(self, info):
        """
        info: dist
        example: info = {character: (x, y), stones: [(x, y), (x, y)]}
        """
        self.character = info['character']
        self.stones = info['stones']

    def get_map(self):
        """
        return: {
            "character": (x, y),
            "stones": [(x, y), (x, y)],
            "switches": [(x, y), (x, y)],
        }
        """
        return {
            "character": self.character,
            "stones": self.stones,
            "switches": self.switches
        }

    def getStoneWeight(self, x, y):
        for i, stone in enumerate(self.stones):
            if stone == (x, y):
                return int(self.weights[i])
        return 0

    def find_position(self, char):
        for y, row in enumerate(self.map):
            for x, cell in enumerate(row):
                if cell == char:
                    return x, y

    def charToMove(self, char):
        if char == 'u' or char == 'U':
            return (0, -1)
        if char == 'd' or char == 'D':
            return (0, 1)
        if char == 'l' or char == 'L':
            return (-1, 0)
        if char == 'r' or char == 'R':
            return (1, 0)
        return (0, 0)
                
    def check_move(self, char):
        x, y = self.character
        dx, dy = self.charToMove(char)
        new_x, new_y = x + dx, y + dy

        if new_x < 0 or new_x >= self.width or new_y < 0 or new_y >= self.height:
            return 0
        
        if (new_x, new_y) in self.walls:
            return 0
        
        if (new_x, new_y) in self.stones:
            if (new_x + dx, new_y + dy) in self.stones or (new_x + dx, new_y + dy) in self.walls:
                return 0
            return 2
        
        return 1
        
    def available_moves(self):
        moves = []
        for direction in self.directions:
            if self.check_move(direction) == 1:
                moves.append(direction)
            elif self.check_move(direction) == 2:
                moves.append(direction.upper())

        return moves

    def render_map(self, character, stones):
        map = [[' ' for _ in range(self.width)] for _ in range(self.height)]
        for x, y in self.walls:
            map[y][x] = '#'
        for x, y in self.switches:
            map[y][x] = '.'
        for x, y in stones:
            if (x, y) in self.switches:
                map[y][x] = '*'
            else:
                map[y][x] = '$'
        x, y = character
        if (x, y) in self.switches:
            map[y][x] = '+'
        else:
            map[y][x] = '@'
        return map

    def matrixAfterMove(self, char):
        if char not in self.available_moves():
            return None
        
        dx, dy = self.charToMove(char)
        new_x, new_y = self.character[0] + dx, self.character[1] + dy

        weight = 0

        stones = self.stones.copy()
        if char.isupper():
            for i in range(len(stones)):
                if (new_x, new_y) == stones[i]:
                    weight = int(self.weights[i])
                    stones[i] = (new_x + dx, new_y + dy)
                    break

        new_map = self.render_map((new_x, new_y), stones)
        info = {
            "character": (new_x, new_y),
            "stones": stones,
            "switches": self.switches
        }

        return new_map, info, weight
    
    def allAvailableMoves(self):
        moves = self.available_moves()
        result = []
        for move in moves:
            new_map, info, weight = self.matrixAfterMove(move)
            result.append((move, new_map, info, weight))

        return result

    def move(self, char):
        if char not in self.available_moves():
            return False, 0

        dx, dy = self.charToMove(char)
        new_x, new_y = self.character[0] + dx, self.character[1] + dy
        self.character = (new_x, new_y)

        weight = 0

        if char.isupper():
            weight = self.getStoneWeight(new_x, new_y)
            for i in range(len(self.stones)):
                if (new_x, new_y) == self.stones[i]:
                    self.stones[i] = (new_x + dx, new_y + dy)
                    break
        
        return True, weight
    
    def getMap(self):
        return self.render_map(self.character, self.stones)

    def is_win(self):
        for x, y in self.switches:
            if (x, y) not in self.stones:
                return False
        return True

    def print_map(self):
        for row in self.getMap():
            print(''.join(row))

def getWeight(map_path, path):
    game = AresGame()
    game.load_map(map_path)
    weight = 0
    for char in path:
        k, w = game.move(char)
        weight += w
    return weight
    