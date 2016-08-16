%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui calcule la quantité 2/(k*(k+1)) * sum(ratioFrobenius)
% ref : Contributions à l'étude de la classification spectrale et 
% applications, Sandrine Mouysset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ tmp , res ] = testClasse( nbClass , val , Wcal)
tab = CalculPaire( nbClass );
res = zeros(nbClass,nbClass);
tmp = 0;
for i = 1:1:size(tab,2)
    var = ratioFrobenius( val , Wcal , tab(1,i) , tab(2,i));
    tmp = tmp + var;
    res( tab(1,i) , tab(2,i) ) = var;
end

for i=1:1:nbClass
    res( i , i ) = ratioFrobenius( val , Wcal , i , i);
end
tmp = 2*tmp/(nbClass*(nbClass-1));

end

