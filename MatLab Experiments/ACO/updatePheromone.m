% Updates the current pheromone matrix based on current pheromone (tau) +
% 1/lengthOfPath
function [tau, colony] = updatePheromone(tau, colony)

num_nodes = length(colony.ant(1).tour);
antPop = length(colony.ant(:));

for i = 1 : antPop
    for j = 1 : num_nodes -1
        
        current_node = colony.ant(i).tour(j);
        next_node = colony.ant(i).tour(j+1);
        
        tau(current_node, next_node) = tau(current_node, next_node) + 1/colony.ant(i).fitness;
        tau(next_node, current_node) = tau(current_node, next_node) + 1/colony.ant(i).fitness;
        
    end
end
end