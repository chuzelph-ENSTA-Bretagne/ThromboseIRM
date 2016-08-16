%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui impl�mente l'algorithme de Sparse Representation pour la
% classification spectrale.
% ref : Image Clustering via Sparse Representation, Jun Jiao, Xuan Mo, 
% and Chen Shen
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


function [ Ver,L,VectP,ValP ] = standard_SparseSC( W, k ,affichage)
[ L ] = LaplacienSTD( W );
[VectP,ValP] = eigs(L,k,0);
tmp = sqrt(sum(VectP.^2,2))*ones(1,k);
VectP = VectP./tmp;
if(affichage)
    AffichageVectP( VectP , k );
end
Ver = kmeans(VectP, k,'emptyaction','singleton');
end

