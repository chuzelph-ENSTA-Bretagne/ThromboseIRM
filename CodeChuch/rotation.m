%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcul la matrice de rotation selon theta entre les axes i
% et j dans un espace � n dimension.
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ R ] = rotation( theta,i,j,n )
R = eye(n,n);
if(i>j)
    fprintf('couple non autoris�e')
else
    R([i,j],[i,j])=0;
    R(i,i) = cos(theta);
    R(j,j) = cos(theta);
    R(i,j) = -sin(theta);
    R(j,i) = sin(theta);
end


end

