classdef Build < Maze
    properties
        wall
        road
    end
    
    methods
            function obj = Build(filename)
                obj@Maze(filename);
             
                [wallrow, wallcol] = find(obj.map ==Build.WALL);
                obj.wall = [wallrow, wallcol]; 
                
                [roadrow, roadcol] = find(obj.map ==Build.ROAD);
                obj.road = [roadrow, roadcol]; 
               
                drawBorder(obj);
                hold on;
                drawDot(obj);
                
            end
        
            function  drawBorder(obj)
                 for order=1:1:size(obj.wall, 1)
                        if ( obj.wall(order, 2)-1 == 0 || obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) ~= Maze.WALL) %left
                            line( [obj.wall(order, 2)-.5, obj.wall(order, 2)-.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5]);
                        end                        
                        if ( obj.wall(order, 2)+1 > obj.width || obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) ~= Maze.WALL) %right
                            line(  [obj.wall(order, 2)+.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5] );
                        end
                       if ( obj.wall(order, 1)-1 ==0 || obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) ~= Maze.WALL) %top
                            line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)-.5] );
                       end
                       if ( obj.wall(order, 1)+1 > obj.height || obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) ~= Maze.WALL) %down
                            line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)+.5, obj.wall(order, 1)+.5] );
                       end
                  end
                    set(gca,'Color','black', 'YDir','reverse');
            end
            
            function drawDot(obj)
                plot(obj.origin(2), obj.origin(1), 'y.', 'MarkerSize', 20)
                plot(obj.final(2), obj.final(1), 'y.', 'MarkerSize', 20)
                plot(obj.road(:, 2), obj.road(:, 1), 'g.',  'MarkerSize', 20)
                plot(obj.portal(2, :), obj.portal(1, :), 'w.',  'MarkerSize', 20)
            end
        
    end
end