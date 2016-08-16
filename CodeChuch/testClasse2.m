%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule tous les ratios |Lij|/|Lii| et les place dans la
% matrice res.
% ref : Contributions à l'étude de la classification spectrale et 
% applications, Sandrine Mouysset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ res ] = testClasse2( nbClass , val , Wcal)
res = zeros(nbClass,nbClass);
for i = 1:1:nbClass
    for j = 1:1:nbClass
        res(i,j) = norm(Wcal(val==i,val==j),'fro');
    end
end

end

