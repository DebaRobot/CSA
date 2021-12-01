%% Pharse 2 : Defining Objective Function

function out =  fns(X)
    x = X(:,1);
    y = X(:,2);
    z = X(:,3);
    
    out = (sin(x*pi)./x).*(sin(y*pi)./y).*(sin(z*pi)./z); 
end        
