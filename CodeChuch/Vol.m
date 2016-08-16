%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui impl�mente vol(A)
% ref : Contribution � l'analyse de l'IRM dynamique pour l�aide au 
% diagnostic du cancer de la prostate, Sandrine Mouysset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ vol ] = Vol( W , A )

[ D , degs] = DegreeFunction( W );
vol = sum(degs(A));


end

