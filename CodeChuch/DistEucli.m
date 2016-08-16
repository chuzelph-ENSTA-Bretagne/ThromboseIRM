%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
%
% Fonction qui calcule la matrice des distance euclidiennes de l'ensemble
% de données X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ W ] = DistEucli( X )
W = zeros(length(X),length(X));
for i=1:1:length(X)
    for j=1:1:length(X)
        W(i,j) = (sum((X(i,:)-X(j,:)).^2))^0.5;
    end
end
end

