% Perform roulette wheel selection to generate a new population.

function newpop = RWselection(pop,fitnesses,populationSize)

fitvalue = fitnesses / sum(fitnesses);  
p_fitvalue = cumsum(fitvalue);          
q_rand = sort(rand(populationSize,1));  

i = 1;  % Pointer for random numbers
j = 1;  % Pointer for cumulative probability intervals

while i <= populationSize
    if q_rand(i) < p_fitvalue(j)
        newpop(i,:) = pop(j,:);  % Higher fitness genes have a higher probability of being selected
        i = i + 1;
    else
        j = j + 1;  % Move to the next probability interval when the current one is exhausted
    end
end
end

