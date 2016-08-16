%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule tous les couples (i,j) tel que i<j et i,j<n
%
% INPUT
% n : entier pour lequel i,j<n
%
% OUTPUT
% tab : tableau de deux lignes qui contient tous les couples (i,j)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ tab ] = CalculPaire( n )

nbPaires = n*(n-1)/2;
A = ones(n)-tril(ones(n));
Ens = find(A==1);

tab = zeros(2,nbPaires);
for i = 1:1:nbPaires
    tab(1,i)=mod(Ens(i),n);
    tab(2,i)=ceil(Ens(i)/n);

end

