% Evaluates the fitness of the current solution
function [fitness] = calculateFitness(tour, graph)

fitness = 0;

for i = 1 : length(tour)-1
    current_node = tour(i);
    next_node = tour(i+1);
    
    fitness = fitness + graph.edges(current_node, next_node);
end
end