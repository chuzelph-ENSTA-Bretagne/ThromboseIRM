%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     %
%           Identification  et  Caract�risation  de la thrombose          %
%                           grace aux IRMs                                %
%                 Code pour la classification Spectrale                   %
%                           Fait par Chuch.                               %
%
% Fonction qui impl�mente cut(A,B)
% ref : Contribution � l'analyse de l'IRM dynamique pour l�aide au 
% diagnostic du cancer de la prostate, Guillaume TARTARE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ cut ] = Cut( W,A,B )
cut = sum(sum(W(A,B)));
end

