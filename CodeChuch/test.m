%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcul la fonction de cout associ� aux vecteur de rotation x
% (n composante de rotation).
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%
% INPUT
% x : vecteur des param�tres qui doit �tre optimis�
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

