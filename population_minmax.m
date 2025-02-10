%Note: the last two activated positions might not meet the minDist requirement.
function Population = population_minmax(populationSize, chromosomeSize, minDist, maxDist)
    Population = zeros(populationSize, chromosomeSize);  
    for i = 1:populationSize
        chromosome = zeros(1, chromosomeSize);  
        chromosome(1) = 1;  
        chromosome(chromosomeSize) = 1;  
        currentPos = 1;  
        while currentPos < chromosomeSize
            remainingSpace = chromosomeSize - currentPos;  
            if remainingSpace <= maxDist  
                break;
            end

            nextPos = currentPos + randi([minDist, maxDist]);  
            if nextPos >= chromosomeSize  
                break;
            end
            chromosome(nextPos) = 1;  
            currentPos = nextPos;  
        end
        Population(i, :) = chromosome; 
    end
end




