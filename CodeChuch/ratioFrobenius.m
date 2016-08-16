%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
% Fonction qui calcule le ratio |Lij|/|Lii|
% ref : Contributions � l'�tude de la classification spectrale et 
% applications, Sandrine Mouysset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ rij ] = ratioFrobenius( val , Wcal , i , j)
Wred = Wcal(val==i,val==j);
Wredii = Wcal(val==i,val==i);
rij = norm(Wred,'fro')/norm(Wredii,'fro');

end

