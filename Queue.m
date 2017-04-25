classdef Queue < handle
    properties
        container
    end
    
    methods
        function []=push(obj,value)
            obj.container = [obj.container value];
        end
        
        function value = pop(obj)
            if(obj.is_empty())
                me = MException('Queue:popFromEmptyQueue','Cannot Pop from empty Queue');
                throw(me);
            end
            value = obj.container(:,1);
            obj.container = obj.container(:,2:end);
        end
        
        function value = is_empty(obj)
            value = isempty(obj.container);
        end
    end
    
end

