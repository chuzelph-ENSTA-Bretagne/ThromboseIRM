function [ S ] = transverse_relaxation_rate( X , TE )

% Calcul of the Delta R2

S0 = X(:,1);
size(S0)
Xnew = X./(S0*ones(1,size(X,2)));
Delta_R2 = -log(Xnew)/TE;
S = sum(Delta_R2, 2);

end

