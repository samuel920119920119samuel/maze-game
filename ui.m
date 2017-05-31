classdef ui<Build
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        current_route;
        total_route;
        route_val_txt;
        length_val_txt;
    end
    
    methods
        function obj = ui(filename)
             obj@Build(filename);
             obj.paths = obj.compute_paths(obj);
             obj.current_route = 1;
             obj.total_route = length(obj.paths);
             width = 100;
             height = 20;         
            
             route_txt = uicontrol('Style','text', 'Position',[0 height width height],'String','route:');
             obj.route_val_txt = uicontrol('Style','text', 'Position',[width height width height],'String', obj.current_route);
             length_txt = uicontrol('Style','text', 'Position',[width*2 height width height],'String','length:');
             obj.length_val_txt = uicontrol('Style','text', 'Position',[width*3 height width height],'String', obj.paths(1, 1).length);           
             pre_route_btn = uicontrol('Style', 'pushbutton', 'String', 'previous route', 'Position', [width*4 height width height], 'Callback', @obj.preRoute);     
             next_route_btn = uicontrol('Style', 'pushbutton', 'String', 'next route', 'Position', [width*5 height width height], 'Callback', @obj.nextRoute);     
             shortest_path_btn = uicontrol('Style', 'pushbutton', 'String', 'shortest path', 'Position', [width*6 height width height], 'Callback', @obj.shortestPath);     
             trans_path_btn = uicontrol('Style', 'pushbutton', 'String', 'through trans', 'Position', [width*7 height width height], 'Callback', @obj.transPath);     
            
             
             
        end
        function preRoute(obj, source,event)
                disp('preRoute') 
                if obj.current_route-1<=0
                    obj.current_route = obj.total_route;
                else
                    obj.current_route = obj.current_route-1;
                end
                obj.route_val_txt.String = num2str(obj.current_route);
                obj.length_val_txt = obj.paths(obj.current_route, 1).length;
                obj.drawDot(obj.paths(obj.current_route, 1).container);
        end
        function nextRoute(obj, source,event)
                disp('nextRoute')
                if  obj.current_route+1 > obj.total_route     %bugggggggg
                    obj.current_route = 1;
                else
                    obj.current_route = obj.current_route+1;
                end
                obj.route_val_txt.String = num2str(obj.current_route);
                obj.length_val_txt = obj.paths(obj.current_route, 1).length;
                obj.drawDot(obj.paths(obj.current_route, 1).container);
        end
        function shortestPath(obj, source,event)
            disp('shortestPath')
            obj.route_val_txt.String = num2str(obj.current_route);
            obj.length_val_txt = obj.paths(1, 1).length;
            obj.drawDot(obj.paths(1, 1).container);
        end
        function transPath(obj, source,event)
                disp('transPath')
                for i = 1:1:obj.total_route
                    if find(obj.paths(i, 1).container == obj.portal(:,1),1)                      
                        obj.current_route = i;
                        break;
                    else
                        obj.current_route = 0;
                    end
                end
                disp(obj.current_route);
                obj.route_val_txt.String = num2str(obj.current_route);
                obj.length_val_txt = obj.paths(obj.current_route, 1).length;
                obj.drawDot(obj.paths(obj.current_route, 1).container);  
            end
    end
end

