classdef Move < Build
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       current_pos;
       next_pos;
       way_though;
       direction;
       fig;  
    end
    
    methods
         function obj = Move(filename)
                global steps;
                 obj@Build(filename);
                 %obj.build = Build(filename);
                 obj.current_pos = obj.origin;
                 obj.next_pos = obj.current_pos;            
                 obj.way_though(:,steps) = obj.origin;
                 plot(obj.current_pos(2), obj.current_pos(1), 'y.',  'MarkerSize', 60);
                 Secdraw(-30, 60, 0.4, obj.current_pos(2), obj.current_pos(1))
                 obj.fig = gcf;
                 set(obj.fig,'KeyPressFcn',@obj.key_event);
                 obj.paths = obj.compute_paths(obj);
         end
         function []=key_event(obj,handle,data)
             disp('function')
            global end_game;
            global steps;
             if  (end_game == false && ~strcmp(data.Key,'0')) || strcmp(data.Key,'space')
                disp('if')
                disp(data.Key) 
                 if(strcmp(data.Key,'leftarrow'))
                    obj.next_pos(2) = obj.current_pos(2)-1; 
                    obj.direction = 180;
                elseif(strcmp(data.Key,'rightarrow'))
                   obj.next_pos(2) = obj.current_pos(2)+1;
                   obj.direction = 0;
                elseif(strcmp(data.Key,'uparrow'))
                    obj.next_pos(1) = obj.current_pos(1)-1;
                    obj.direction = 270;
                elseif(strcmp(data.Key,'downarrow'))
                    obj.next_pos(1) = obj.current_pos(1)+1; 
                    obj.direction = 90;
                elseif(strcmp(data.Key,'space'))    
                    main();
                    return;
                end      
                switch obj.map(obj.next_pos(1), obj.next_pos(2) )
                   case Move.WALL
                      obj.next_pos = obj.current_pos;
                   case Move.FINAL
                      obj.current_pos =  obj.next_pos;
                      end_game  = true;
                      steps = steps+1;
                   case Move.PORTAL
                      if obj.next_pos == obj.portal(:,1)
                          obj.next_pos = obj.portal(:,2);
                      elseif obj.next_pos == obj.portal(:,2)
                          obj.next_pos = obj.portal(:,1);
                      end
                      obj.current_pos = obj.next_pos;
                      steps = steps+1;
                    otherwise
                       disp('switch')
                      obj.current_pos =  obj.next_pos;
                      steps = steps+1;
                      
                end
                obj.way_though(:,steps) = obj.current_pos;
                obj.drawDot( obj.way_though);                
                plot(obj.current_pos(2), obj.current_pos(1), 'y.',  'MarkerSize', 60);
                pause(0.15);
                Secdraw(obj.direction-30, 60, 0.4, obj.current_pos(2), obj.current_pos(1))
             end
          end
    end
    
end

