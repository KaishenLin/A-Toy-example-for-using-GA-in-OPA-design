% populationSize * chromosomeSize
function Population = population(populationSize, chromosomeSize )
    Population = randi([0, 1], populationSize, chromosomeSize);
end



