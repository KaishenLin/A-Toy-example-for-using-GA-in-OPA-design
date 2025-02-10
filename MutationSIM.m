% Simple inverse mutation
function newpop_m = MutationSIM(newpop_c, populationSize, chromosomeSize, p_mutation)
    newpop_m = newpop_c;
    for i = 1:populationSize
        if rand < p_mutation
            loc1 = randi([1, chromosomeSize]);
            loc2 = randi([1, chromosomeSize]);
            start_loc = min(loc1, loc2);
            end_loc = max(loc1, loc2);
            substring = newpop_c(i, start_loc:end_loc);
            reversed_substring = fliplr(substring);
            remaining_chromosome = [newpop_c(i, 1:start_loc-1), newpop_c(i, end_loc+1:end)];

            insert_loc = randi([0, length(remaining_chromosome)]); % allow to insert in the start or the end
            newpop_m(i, :) = [remaining_chromosome(1:insert_loc), reversed_substring, remaining_chromosome(insert_loc+1:end)];
        end
    end
end
