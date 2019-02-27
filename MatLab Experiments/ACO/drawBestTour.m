% Draws visual solution in graphical format
function [] = drawBestTour(queen, graph)

queenTour = queen.tour;
hold on

for i = 1 : length(queenTour) -1
    current_node = queenTour(i);
    next_node = queenTour(i+1);
    
    x1 = graph.node(current_node).x;
    y1 = graph.node(current_node).y;
    
    x2 = graph.node(next_node).x;
    y2 = graph.node(next_node).y;
    
    x = [x1, x2];
    y = [y1, y2];
    
    plot(x, y, '-r');
end 

for i = 1 : graph.n
    x = [graph.node(:).x];
    y = [graph.node(:).y];
    
    plot(x, y, 'ok', 'markerSize', 10, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [1, 0.5, 0.5]);
    
end
title('Best Solution');
box('on');
end