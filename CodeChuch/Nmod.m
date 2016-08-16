%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui implémente Nmod( W,Table ) où W est la matrice de voisinage
% et Table est la table de vérité.
% ref : Contribution à l'analyse de l'IRM dynamique pour l’aide au 
% diagnostic du cancer de la prostate, Guillaume TARTARE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ nmod , modI] = Nmod( W,Table )
nbClasse = max(Table);

TabCell = cell(nbClasse,1);
modI = zeros(nbClasse,1);


for i = 1:1:nbClasse
    TabCell{i} = find(Table==i);
end

cutVV = Cut(W,1:length(W),1:length(W));
for i = 1:1:nbClasse
    cutAV = Cut(W,TabCell{i},1:length(W));
    cutAA = Cut(W,TabCell{i},TabCell{i});
    modI(i) = (1/cutAV)*(cutAA/cutVV-(cutAV/cutVV)^2);
end 

nmod = sum(modI);

end

