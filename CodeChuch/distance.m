%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     %
%           Identification  et  Caractérisation  de la thrombose          %
%                           grace aux IRMs                                %
%                 Code pour la classification Spectrale                   %
%                           Fait par Chuch.                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction qui calcule la matrice de voisinage de l'ensemble de donnée X.
% L'algorithme va chercher à calculer les paramètres de dispersion de
% chaque point puis va calculer la matrice de voisinage grace à un noyau
% gaussien.
% ref : Contributions à l'étude de la classification spectrale et 
% applications, Sandrine Mouysset
% ref : Contribution à l'analyse de l'IRM dynamique pour l’aide au 
% diagnostic du cancer de la prostate, Guillaume TARTARE
%
% INPUT:
% X : vecteur des données à trier
% r : N° du voisin à considérer
%
% OUTPUT:
% W : Matrice d'affinité associée aux données X
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function W = distance( X , r)
W = zeros(length(X),length(X));

Sigma = GetSigma( X , r ); 
for i=1:1:length(X)
    for j=1:1:length(X)
        W(i,j) = exp(-(sum((X(i,:)-X(j,:)).^2))^0.5/(2*Sigma(i)*Sigma(j)));
    end
end


end

