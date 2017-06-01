function main()
    file = 'maze.txt';

    global end_game;
    end_game = false;

    ui(file);
    Build(file);
    Move(file);
end
