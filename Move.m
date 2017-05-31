classdef Move < Build
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       current_pos;
       next_pos;
       step;
       way_though;
       end_game;
       fig;
       
    end
    
    methods
         function obj = Move(filename)
                 obj@Build(filename);
                 %obj.build = Build(filename);
                 obj.current_pos = obj.origin;
                 obj.next_pos = obj.current_pos;
                 obj.end_game = false;                
                  obj.step = 0;
                 plot(obj.current_pos(2), obj.current_pos(1), 'y.',  'MarkerSize', 40);
                 obj.fig = gcf;
                 set(obj.fig,'KeyReleaseFcn',@obj.key_event);
                 obj.paths = obj.compute_paths(obj);
         end
         function []=key_event(obj,handle,data)
             disp('function')
             if  obj.end_game == false && ~strcmp(data.Key,'0')
                disp('if')
                disp(data.Key) 
                 if(strcmp(data.Key,'leftarrow'))
                    obj.next_pos(2) = obj.current_pos(2)-1;                 
                elseif(strcmp(data.Key,'rightarrow'))
                   obj.next_pos(2) = obj.current_pos(2)+1;
                   disp('right')
                elseif(strcmp(data.Key,'uparrow'))
                    obj.next_pos(1) = obj.current_pos(1)-1;
                elseif(strcmp(data.Key,'downarrow'))
                    obj.next_pos(1) = obj.current_pos(1)+1; 
                    disp('down')
                end      
                switch obj.map(obj.next_pos(1), obj.next_pos(2) )
                   case Move.WALL
                      obj.next_pos = obj.current_pos;
                   case Move.FINAL
                      obj.current_pos =  obj.next_pos;
                      obj.end_game = true;
                      obj.step = obj.step+1;
                   case Move.PORTAL
                      if obj.next_pos == obj.portal(:,1)
                          obj.next_pos = obj.portal(:,2);
                      elseif obj.next_pos == obj.portal(:,2)
                          obj.next_pos = obj.portal(:,1);
                      end
                      obj.current_pos = obj.next_pos;
                      obj.step = obj.step+1;
                    otherwise
                       disp('switch')
                      obj.current_pos =  obj.next_pos;
                      obj.step = obj.step+1;
                      
                end
                obj.way_though(:,obj.step) = obj.current_pos;
                obj.drawDot( obj.way_though);
                plot(obj.current_pos(2), obj.current_pos(1), 'y.',  'MarkerSize', 40);
               
             end
          end
    end
    
end

