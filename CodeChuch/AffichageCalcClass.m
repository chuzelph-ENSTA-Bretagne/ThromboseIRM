%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui affiche la fonction de cout pour un nombre n maximale de
% classe.
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function AffichageCalcClass( Z , n )
tmp = zeros(1,n);
for i=1:1:n
    tmp(i) = Fcout( Z , i );
end
figure
plot(tmp)

end

