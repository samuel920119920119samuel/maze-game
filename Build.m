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
                %obj.paths = obj.compute_paths(obj);
                %drawDot(obj,  obj.paths(2, 1).container);
                
            end
        
            function  drawBorder(obj)
                 %inner border
                for order=1:1:size(obj.wall, 1)
                        if ( obj.wall(order, 2)-1 == 0 || obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) ~= Maze.WALL) %left
                            line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)+.25]);
                            % if ( obj.wall(order, 1)-1 ~=0 && obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) == Maze.WALL) %top
                                % line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.5]);
                             %end
                            % if ( obj.wall(order, 1)+1 < obj.height && obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) == Maze.WALL) %down
                                 %line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.5]);
                             %end
                        end                        
                        if ( obj.wall(order, 2)+1 > obj.width || obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) ~= Maze.WALL) %right
                            line(  [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)+.25] );
                             %if ( obj.wall(order, 1)-1 ~=0 && obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) == Maze.WALL) %top
                                 %line( [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.5]);
                             %end
                             %if ( obj.wall(order, 1)+1 < obj.height && obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) == Maze.WALL) %down
                                 %line( [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.5]);
                             %end
                        end
                       if ( obj.wall(order, 1)-1 ==0 || obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) ~= Maze.WALL) %top
                            line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25] );
                             %if ( obj.wall(order, 2)-1 ~= 0 && obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) == Maze.WALL) %left
                                 %line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)-.5], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25] );
                             %end
                             %if ( obj.wall(order, 2)+1 < obj.width && obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) == Maze.WALL) %right
                                 %line(  [obj.wall(order, 2)+.25, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25] );
                             %end
                       end
                       if ( obj.wall(order, 1)+1 > obj.height || obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) ~= Maze.WALL) %down
                            line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.25] );
                             %if ( obj.wall(order, 2)-1 ~= 0 && obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) == Maze.WALL) %left
                                  %line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)-.5], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.25] );
                             %end
                             %if ( obj.wall(order, 2)+1 < obj.width && obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) == Maze.WALL) %right
                                  %line(  [obj.wall(order, 2)+.25, obj.wall(order, 2)+.5], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.25] );
                             %end
                       end
                 end
                 
                  %outer border
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
                  set(gca, 'Color','black', 'YDir','reverse' );
            end
            
            function drawDot(obj, path_pos)
                
                %plot(obj.origin(2), obj.origin(1), 'y.', 'MarkerSize', 40)
                plot(obj.final(2), obj.final(1), 'y.', 'MarkerSize', 40)
                plot(obj.road(:, 2), obj.road(:, 1), 'g.',  'MarkerSize', 20)
                plot(obj.portal(2, :), obj.portal(1, :), 'w.',  'MarkerSize', 20)
                
                plot(path_pos(2, :), path_pos(1, :), 'k.',  'MarkerSize', 20)
                
                %I = imread('pacman.svg.png');         
                %imshow(imrotate(A,90));
               % imshow(I, 'XData', [current_pos(2)-0.25  current_pos(2)+0.25], 'YData', [current_pos(1)-0.25  current_pos(1)+0.25])
                %上下左右寫在哪裡; 背景是白色的

             %[xx, yy]  = Secdraw(45, 90, 1);
             %patch( xx, yy, 'b', 'EdgeColor', 'b', 'EraseMode', 'none', 'XData', [current_pos(2)-0.25  current_pos(2)+0.25], 'YData', [current_pos(1)-0.25  current_pos(1)+0.25]) ;
             %set( gca, 'DataAspectRatio', [1 1 1] );
            end
            
            
        
    end
end