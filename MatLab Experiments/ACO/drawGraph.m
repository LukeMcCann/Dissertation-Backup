% Draw the problem graph in graphical form
% Return void
function [] = drawGraph(graph)
hold on

% Iterate each node pair
% Extract each node pair
for i = 1 : graph.n -1
    for j = i+1 : graph.n 
        x1 = graph.node(i).x;
        y1 = graph.node(i).y;
        
        x2 = graph.node(j).x;
        y2 = graph.node(j).y;
        
        x = [x1, x2];
        y = [y1, y2];
        
        plot(x,y, '-k');
    end
end

% Draw nodes
for i = 1 : graph.n
     % return all values of nodes
    x = [graph.node(:).x]
    y = [graph.node(:).y]
    
    plot(x,y, 'oK');
end
title("Nodes and Edges")
box("on")
end
