%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui implémente vol(A)
% ref : Contribution à l'analyse de l'IRM dynamique pour l’aide au 
% diagnostic du cancer de la prostate, Sandrine Mouysset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ vol ] = Vol( W , A )

[ D , degs] = DegreeFunction( W );
vol = sum(degs(A));


end

