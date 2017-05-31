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
                drawDot(obj, obj.origin);
                
            end
    end
    methods(Access = protected)
            function  drawBorder(obj)
                 %inner border
                for order=1:1:size(obj.wall, 1)
                        if ( obj.wall(order, 2)-1 == 0 || obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) ~= Maze.WALL) %left
                            line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)+.25], 'LineWidth',1.5);
                            % if ( obj.wall(order, 1)-1 ~=0 && obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) == Maze.WALL) %top
                                % line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.5]);
                             %end
                            % if ( obj.wall(order, 1)+1 < obj.height && obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) == Maze.WALL) %down
                                 %line( [obj.wall(order, 2)-.25, obj.wall(order, 2)-.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.5]);
                             %end
                        end                        
                        if ( obj.wall(order, 2)+1 > obj.width || obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) ~= Maze.WALL) %right
                            line(  [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)+.25], 'LineWidth',1.5 );
                             %if ( obj.wall(order, 1)-1 ~=0 && obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) == Maze.WALL) %top
                                 %line( [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.5]);
                             %end
                             %if ( obj.wall(order, 1)+1 < obj.height && obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) == Maze.WALL) %down
                                 %line( [obj.wall(order, 2)+.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.5]);
                             %end
                        end
                       if ( obj.wall(order, 1)-1 ==0 || obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) ~= Maze.WALL) %top
                            line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25], 'LineWidth',1.5);
                             %if ( obj.wall(order, 2)-1 ~= 0 && obj.map( obj.wall(order, 1), obj.wall(order, 2)-1) == Maze.WALL) %left
                                 %line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)-.5], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25] );
                             %end
                             %if ( obj.wall(order, 2)+1 < obj.width && obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) == Maze.WALL) %right
                                 %line(  [obj.wall(order, 2)+.25, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.25, obj.wall(order, 1)-.25] );
                             %end
                       end
                       if ( obj.wall(order, 1)+1 > obj.height || obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) ~= Maze.WALL) %down
                            line(  [obj.wall(order, 2)-.25, obj.wall(order, 2)+.25], [ obj.wall(order, 1)+.25, obj.wall(order, 1)+.25], 'LineWidth',1.5);
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
                            line( [obj.wall(order, 2)-.5, obj.wall(order, 2)-.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5], 'LineWidth',1.5);
                        end                        
                        if ( obj.wall(order, 2)+1 > obj.width || obj.map( obj.wall(order, 1), obj.wall(order, 2)+1) ~= Maze.WALL) %right
                            line(  [obj.wall(order, 2)+.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5], 'LineWidth',1.5);
                        end
                       if ( obj.wall(order, 1)-1 ==0 || obj.map( obj.wall(order, 1)-1, obj.wall(order, 2)) ~= Maze.WALL) %top
                            line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)-.5], 'LineWidth',1.5);
                       end
                       if ( obj.wall(order, 1)+1 > obj.height || obj.map( obj.wall(order, 1)+1, obj.wall(order, 2)) ~= Maze.WALL) %down
                            line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)+.5, obj.wall(order, 1)+.5], 'LineWidth',1.5);
                       end
                  end
                  set(gca, 'Color','black', 'YDir','reverse' , 'xtick',[],'ytick',[]);
            end
            
            function drawDot(obj, path_pos)
                
                %plot(obj.origin(2), obj.origin(1), 'y.', 'MarkerSize', 40)
                plot(obj.final(2), obj.final(1), 'y.', 'MarkerSize', 40)
                plot(obj.road(:, 2), obj.road(:, 1), 'k.',  'MarkerSize', 60)
                plot(obj.road(:, 2), obj.road(:, 1), 'o','MarkerFaceColor', [0.9 0.8 0.7],  'MarkerSize', 5, 'MarkerEdgeColor', [0.9 0.8 0.7])
                plot(path_pos(2, :), path_pos(1, :), 'k.',  'MarkerSize', 60)
                plot(obj.portal(2, :), obj.portal(1, :), 'o','MarkerFaceColor', [0.9 0.8 0.7],  'MarkerSize', 10, 'MarkerEdgeColor', [0.9 0.8 0.7])

            end

    end
end