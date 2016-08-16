%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui affiche les données classifiées selon la table H
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function  affichageVerite( x,y,H )
figure()
hold on
for i=1:1:length(x)
    if(H(i)==1)
            plot(x(i),y(i),'+r')
    end
    if(H(i)==2)
        plot(x(i),y(i),'+b')
    end
    if(H(i)==3)
        plot(x(i),y(i),'+g')
    end
    if(H(i)==4)
        plot(x(i),y(i),'+y')
    end
end
hold off


end

