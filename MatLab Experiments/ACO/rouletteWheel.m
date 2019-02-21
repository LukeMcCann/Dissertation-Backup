% Roulette Wheel for random selection based on probabilities
% Return next_node, Param probabilities
function [next_node] = rouletteWheel(P)

% Calculate cumulative sum of probabilities
cumulative_sum_P = cumsum(P);

% Generate random
r = rand();

% next_node equates to the random which is less than or equal to the
% cumulative value
next_node = find(r <= cumulative_sum_P);

next_node = next_node(1);
end