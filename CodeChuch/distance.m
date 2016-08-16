%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     %
%           Identification  et  Caract�risation  de la thrombose          %
%                           grace aux IRMs                                %
%                 Code pour la classification Spectrale                   %
%                           Fait par Chuch.                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction qui calcule la matrice de voisinage de l'ensemble de donn�e X.
% L'algorithme va chercher � calculer les param�tres de dispersion de
% chaque point puis va calculer la matrice de voisinage grace � un noyau
% gaussien.
% ref : Contributions � l'�tude de la classification spectrale et 
% applications, Sandrine Mouysset
% ref : Contribution � l'analyse de l'IRM dynamique pour l�aide au 
% diagnostic du cancer de la prostate, Guillaume TARTARE
%
% INPUT:
% X : vecteur des donn�es � trier
% r : N� du voisin � consid�rer
%
% OUTPUT:
% W : Matrice d'affinit� associ�e aux donn�es X
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

