%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui affiche les k premi�res valeurs propres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function AffichageVectP( VectP , k )
figure
plot(VectP)
figure
hold on
for i = 1:1:k
    subplot(ceil(k/3),3,i)
    plot(VectP(:,i))
hold off
end

