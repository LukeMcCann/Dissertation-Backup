close all 
clc

%% Create the Problem

% Create Graph 
[graph] = createGraph();

% Draw
figure
subplot(1, 3, 1)
drawGraph(graph);


%% ACO Algorithm

% Initial Parameters
max = 100;
antPop = 10;

% Calc the average of the distances between all edges in graph * #NO edges
% Pheromone concentration
tau0 = 10*1/( graph.n * mean(graph.edges(:) ));

% Create pheramone matrices 
tau = tau0 * ones(graph.n, graph.n);

% Edge desirability: shorter is more desirable
% Can be reversed to find the longest path via graph.edges
eta = 1 ./graph.edges;

% Evaporation rate
rho = 0.05;

% Pheromone param
alpha = 1;
% Desirability param
beta = 1;

best_fitness = inf;
best_tour = [];

% Main Loop
for t = 1 : max
    
    % Create Colony
    colony = [];
    colony = createColony(graph, colony, antPop, tau, eta, alpha, beta);
    
    % Calculate Fitness
    for i = 1 : antPop
        colony.ant(i).fitness = calculateFitness(colony.ant(i).tour, graph);
    end
    
    % Find Best Solution
    allAntsFitness = [colony.ant(:).fitness];
    [min_value, min_index] = min(allAntsFitness);
    
    if min_value < best_fitness
        best_fitness = colony.ant(min_index).fitness;
        best_tour = colony.ant(min_index).tour;
    end
    
    % Update Queen
    colony.queen.tour = best_tour;
    colony.queen.fitness = best_fitness;
    
    % Update Pheromone Matrix
    tau = updatePheromone(tau, colony);
    
    % Evaporate
    tau = (1 - rho).* tau;
    
    % Print Solution
    result = ["Iteration Number: ", num2str(t), "Shortest Path: ", num2str(colony.queen.fitness)];
    disp(result);
    
    % Draw Solution Graph
    subplot(1,3,2)
    cla
    drawBestTour(colony.queen, graph);
    
    % Draw Pheromone Trail on graph
    subplot(1,3,3)
    cla
    drawPheromone(tau, graph);
    
    
    drawnow
end
