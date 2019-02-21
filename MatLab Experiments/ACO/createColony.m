% Creates the colony and adds to the graph for tour
function [colony] = createColony(graph, colony, antPop, tau, eta, alpha, beta)

num_nodes = graph.n;

% Create each ant for pop
for i = 1 : antPop
    % Randomly select a node
    start_node = randi([1,num_nodes]);
    % Add node to first ant
    colony.ant(i).tour(1) = start_node;
    
    % Select nodes for next generations
    for j = 2 : num_nodes
        current_node = colony.ant(i).tour(end);
        
        % Calculate probabilities of all nodes
        P_all_nodes = tau(current_node, :).^alpha.*eta(current_node, :).^beta;
        
        % Assign 0 to all visited nodes
        P_all_nodes(colony.ant(i).tour) = 0;
        
        % Final probabilities
        P = P_all_nodes ./sum(P_all_nodes);
        
        
        % Select next node based on calculated probability
        % Roulette Wheel
        next_node = rouletteWheel(P);
        colony.ant(i).tour = [colony.ant(i).tour, next_node];
        
    end
    % Complete tour (connect back to first node)
    colony.ant(i).tour = [colony.ant(i).tour, colony.ant(i).tour(1)];
end
end