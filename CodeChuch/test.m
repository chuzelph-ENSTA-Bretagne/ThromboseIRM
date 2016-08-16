%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcul la fonction de cout associé aux vecteur de rotation x
% (n composante de rotation).
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%
% INPUT
% x : vecteur des paramètres qui doit être optimisé
%
% OUTPUT
% J : valeur de la fonction de cout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ J ] = test( x )
global VectP
R  = RotFunc( x );
Z = VectP*R;
Zsum = sum(Z.^2,2);
M = max(Z.^2,[],2);
J = sum(Zsum.*M);
end

