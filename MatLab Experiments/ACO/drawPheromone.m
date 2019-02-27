% Display pheromone trails on grpah
% Find Max Pheromone and Min Pheromone
% Change color proportional to Pheromone level
function [] = drawPheromone(tau, graph)

hold on
max_pheromone = max(tau(:));
min_pheromone = min(tau(:));

tau_normalized = (tau - min_pheromone)/ (max_pheromone - min_pheromone);

for i = 1 : graph.n -1
    for j = i+1 : graph.n
        x1 = graph.node(i).x;
        y1 = graph.node(i).y;
        
        x2 = graph.node(j).x;
        y2 = graph.node(j).y;
        
        x = [x1, x2];
        y = [y1, y2];
        
        tau(i, j);
        plot(x,y, 'color' , [0, 0, (1-tau_normalized(i,j)),  tau_normalized(i,j)] , 'lineWidth', 10.*tau_normalized(i,j) + 1)
        
    end
end

for i = 1 : graph.n
    hold on
    X = [graph.node(:).x];
    Y = [graph.node(:).y];
    plot(X , Y , 'ok',  'MarkerSize', 10, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', [1, 0.5, 0.5])
end


title('Pheromone')
box on
end