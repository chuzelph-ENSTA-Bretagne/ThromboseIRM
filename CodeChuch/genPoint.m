%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     %
%           Identification  et  Caractérisation  de la thrombose          %
%                           grace aux IRMs                                %
%                 Code pour la classification Spectrale                   %
%                           Fait par Chuch.                               %
%
% Fonction qui genère des points autour d'un cercle de rayon r, avec un
% bruit Noise.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ x,y ] = genPoint( rayon,nbPoint,Noise )
    
theta = linspace(0,2*pi,nbPoint);
Rayon = rayon+Noise*randn(1,nbPoint);
x = Rayon.*cos(theta);
y = Rayon.*sin(theta);


end

