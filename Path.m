classdef Path < handle
    %hold path from one cell to another
    properties
        container %hold the postion of passed-by cells
        length %length of the path (the including cells number)
    end
    
    methods (Static = true)
        function value = equals(p1, p2)
            %Is two pairs equal
           value = (p1 == p2);
           value = value(1) && value(2);
        end
    end
    
    methods
        function obj=Path(path)
            obj.container = path;
            obj.length = 1;
        end
        
        function RowCol = last(obj)
            RowCol = obj.container(:,end);
        end
        
        function RowCol = prelast(obj)
            if(obj.length == 1)
                RowCol = [0,0];
            else
                RowCol = obj.container(:,end-1);
            end
        end
        
        function obj = add(obj,next)
            %add next position path
            obj.container = [obj.container next];
            obj.length = obj.length + 1;
        end
        
        function newPath = clone(obj)
            %clone the path object
            newPath = Path(obj.container);
            newPath.length = obj.length;
        end
        
        function value = is_cycle(obj, position)
            % check if position and path obj form a cycle
            value = obj.container == position;
            value = value(1,:) + value(2,:);
            value = ~isempty(find(value == 2, 1));
        end
    end
    
    
end

