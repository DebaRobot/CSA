%% Find the current best
[fmin, K1] = min(fx);
best = nest(K1, :);


%% Replace Some nest by constructing new solution
K = rand(size(nest)) < pa;

stepsizeK = rand*(nest(randperm(n), :) - nest(randperm(n), :));
new_nest = nest + stepsizeK.*K;


%% Check Bounds
for ii = 1 : size(nest, 1)
    s =new_nest(ii, :);
    for kk = 1 : size(s, 2)
        if s(kk) > ub(kk)
            s(kk) = ub(kk);
        elseif s(kk) < lb(kk)
            s(kk) = lb(kk);
        end
    end
    
    new_nest(ii,:) = s;
end

%% Perform Greedy Selection
    fnew = fns(s);
    if fnew < fx(ii, :)
        nest(ii, :) = s;
        fx(ii, :) = fnew;
    end



%% Finding the optimal Value
[optval, optind] = min(fx);

BestFx(iter) = optval;
BestX(iter, :) = nest(optind, :);

%%
disp(['Iteration ' num2str(iter)...
    ': Best Cost = ' num2str(BestFx(iter))]);



%% Plotting the result
plot(BestFx, 'LineWidth', 2);
xlabel('Iteration Number')
ylabel('Fitness Value')
title('Convergence Vs Iteration')
grid on

