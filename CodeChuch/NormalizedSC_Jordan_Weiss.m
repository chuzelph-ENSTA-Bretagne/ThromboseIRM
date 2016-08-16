%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui impl�mente l'algorithme de Jordan et Weiss pour la
% classification spectrale.
% ref : A Tutorial on Spectral Clustering, Ulrike von Luxburg
%
% INPUT
% W : Matrice de voisinage
% k : Nombre de cluster souhait�
%
% OUTPUT
% Ver   : Table de v�rit� obtenue
% L     : Laplacien de la matrice W
% VectP : Matrice des vecteurs propres extraits
% ValP  : Vecteurs des valeurs propres extraites
%
% ATTENTION : Besoin d'une version de Matlab assez r�cente!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, k ,affichage)
[ L ] = LaplacienNS( W );
[VectP,ValP] = eigs(L,k,0);
tmp = sqrt(sum(VectP.^2,2))*ones(1,k);
VectP = VectP./tmp;
if(affichage)
    AffichageVectP( VectP , k );
end
%Ver = kmeans(VectP, k,'start','plus','emptyaction','singleton');
Ver = kmeans(VectP, k,'emptyaction','singleton');
end

