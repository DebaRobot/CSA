%%

for iter = 1 : max_iter
    [fnv, indf] = min(fx);
    best = nest(indf, :);
    
    for j =  1 : N
        s = nest(j,:);
        X = s;
        %%%Levy Flights by Mantegna's algorithms
        u =  randn(size(s))*sigma;
        v = randn(size(s));
        step = u./abs(v).^(1/beta);
        Xnew = X + randn(size(s)).*0.01.*step.*(X - best);
        
        %%Check Bounds
        for kk = 1: size(Xnew, 2)
            if Xnew(kk) > ub(kk)
                Xnew(kk) = ub(kk);
            elseif Xnew(kk) < lb(kk)
                Xnew(kk) = lb(kk);
            end
        end
        
        %%Perform Greedy Selection
        fnew = fns(Xnew);
        if(fnew<fx(j,:))
            nest(j,:) = Xnew;
            fx(j,:) = fnew;
        end
    end

end

