clc;
close all;

freq = 100e6;                     
c = physconst('LightSpeed');       
lam = 1550e-9;                    
K = 2 * pi / lam;                  
ang_left = -15;                   
ang_right = 15;                    
L = 10000;                         
st_ang = 0;                  % steering angle
space = 1 * lam;             % The limit of 1/2 lam
populationSize = 100;
chromosomeSize = 1000;
maxiter = 100;
p_cross = 0.9;
p_mutation = 0.1;
minDist = 2;
maxDist = 10;

elitismCount = 2;              % Number of elites to preserve
globalBestFitness = -inf;     
globalBestSolution = [];
% Initialize population
pop = population_minmax(populationSize, chromosomeSize,minDist,maxDist);
fitnesses = zeros(1, populationSize);

% profile on

% % GA - normal
% for iter = 1:maxiter
%     calcualte fitness value
%     fitnesses = zeros(populationSize, 1);
%     for i = 1:populationSize
%         [t, a] = AF_fft(pop(i, :), ang_left, ang_right, L, K, st_ang,space);
%         fitnesses(i) = PSLL(a);
%     end
%     [bestFitness, bestIdx] = max(fitnesses); 
%     bestSolutions(iter, :) = pop(bestIdx, :);
%     bestFitnesses(iter) = bestFitness;
% 
%     newpop = RWselection(pop, fitnesses, populationSize);
%     newpop_c = Crossover(newpop, populationSize, chromosomeSize, p_cross);
%     pop = MutationSIM(newpop_c, populationSize, chromosomeSize, p_mutation);
% end

%GA - Elite
for iter = 1:maxiter
    % calcualte fitness value
    fitnesses = zeros(populationSize, 1);
    for i = 1:populationSize
        [t, a] = AF_fft(pop(i, :), ang_left, ang_right, L, K, st_ang,space);
        psll = PSLL(a,t);
        fitnesses(i) = fitnessFunctionSSP (psll,pop(i, :),minDist,maxDist,20,10);
    end

    [bestFitness, bestIdx] = max(fitnesses); 
    bestSolutions(iter, :) = pop(bestIdx, :);
    bestFitnesses(iter) = bestFitness;

    if bestFitness > globalBestFitness
        globalBestFitness = bestFitness;
        globalBestSolution = pop(bestIdx, :);
        firstOccurrence = iter;
    end

    [~, eliteIdx] = maxk(fitnesses, elitismCount); 
    eliteIndividuals = pop(eliteIdx, :);

    nonEliteMask = true(populationSize, 1);
    nonEliteMask(eliteIdx) = false; % set the elit position to false
    % Selection, crossover, and mutation for non-elite individuals
    newpop = RWselection(pop(nonEliteMask, :), fitnesses(nonEliteMask), populationSize - elitismCount);
    newpop_c = Crossover(newpop, populationSize - elitismCount, chromosomeSize, p_cross);
    newpop_m = MutationSIM(newpop_c, populationSize - elitismCount, chromosomeSize, p_mutation);
    pop(nonEliteMask, :) = newpop_m;
    pop(eliteIdx, :) = eliteIndividuals; 

end
% profile off
% profile viewer


% plot
figure;
plot(1:maxiter, bestFitnesses, '-o', 'LineWidth', 1.5);
xlabel('Iteration');
ylabel('Best Fitness');
title('Convergence of Genetic Algorithm');
grid on;

[value, index] = max(bestFitnesses);
bestsolution = bestSolutions(index,:);
actpos = nnz(bestsolution);
[theta, AF_dBbest] = AF_grid(bestsolution, ang_left, ang_right, L, K, st_ang,space);

figure;
plot(theta, AF_dBbest, 'LineWidth', 1.5);
grid on;
xlabel('Angle (degrees)');
ylabel('Array Factor (dB)');
title(['Array Pattern (Steering Angle = ', num2str(st_ang), '°)']);
xlim([ang_left, ang_right]);
ylim([-50, 0.5]); 


pslbest = PSLL(AF_dBbest,theta);
activatedPosition = find(bestsolution == 1);
spacingDiffs = diff(activatedPosition);
illegalnum = sum(spacingDiffs < minDist)+sum(spacingDiffs > maxDist);
sparsityLevel = actpos/chromosomeSize;

diary('log.txt')
disp(['PSLL: ', num2str(pslbest)]);
disp(['Activate number: ',num2str(actpos)]);
disp(['SparsityLevel: ',num2str(sparsityLevel)]);
disp(['Illegal positions: ',num2str(illegalnum)])
diary off


