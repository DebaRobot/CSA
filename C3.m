%% Pharse 3 : Generate Initial Population Range
for i = 1 : N
    for j = 1 : D
        nest(i, j) = lb(:,j) + rand.*(ub(:,j) - lb(:,j))
    end
end
fx = fns(nest);


beta = 3/2;
sigma = (gamma(1 + beta)*sin(pi*beta/2)/(gamma((1 + beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
