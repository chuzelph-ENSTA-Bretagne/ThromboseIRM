%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui impl�mente l'algorithme de Shi et Malik pour la
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


function [ Ver,L,VectP,ValP ] = NormalizedSC_SHI_MALIK( W, k )
[ L ] = LaplacienAS( W );
[VectP,ValP] = eigs(L,k,0);
AffichageVectP( VectP , k );
Ver = kmeans(VectP, k,'start','plus','emptyaction','singleton');
end

