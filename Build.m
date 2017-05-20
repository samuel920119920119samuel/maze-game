classdef Build < Maze
    properties
        wall
    end
    
    methods
            function obj = Build(filename)
                obj@Maze(filename);
             
                [wallrow, wallcol] = find(obj.map ==Build.WALL);
                obj.wall = [wallrow, wallcol]; 
                
                %adjacent(1);
                %line([.5,col+.5],[.5,.5]) % draw top border
                %line([.5,col+.5],[row+.5,row+.5]) % draw bottom border
                %line([.5,.5],[1.5,row+.5]) % draw left border
                %line([col+.5,col+.5],[.5,row-.5])  % draw right border  
                
               
            end
        
            function  drawBorder(obj)
                 for order=1:1:size(obj.wall, 1)
                        line( [obj.wall(order, 2)-.5, obj.wall(order, 2)-.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5]);
                        line(  [obj.wall(order, 2)+.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)+.5] );
                        line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)-.5, obj.wall(order, 1)-.5] );
                        line(  [obj.wall(order, 2)-.5, obj.wall(order, 2)+.5], [ obj.wall(order, 1)+.5, obj.wall(order, 1)+.5] );
                  end
                    set(gca,'Color','black', 'YDir','reverse');
            end
            
            
            
           
           
          
        
        
    end
end