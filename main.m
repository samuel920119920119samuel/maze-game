function main()
    file = 'maze.txt';

    global end_game;
    end_game = false;

    global steps;
    steps= 1;

    ui(file);
    Build(file);
    Move(file);
end
