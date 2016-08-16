%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caractérisation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% Fonction qui affiche 25 courbes qui permettent d'identifier le nombre de
% cluster idéal. Normalement, il faut prendre argmin (n) de la courbe.
% ref : Contributions à l'étude de la classification spectrale et 
% applications, Sandrine Mouysset
%
% INPUT
% nbClasseMax : nombre de classe à tester
% W : matrice de voisinage
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function nbClassOpti( nbClasseMax , W )
figure
hold on
tmp = zeros(nbClasseMax,1);
for j = 1:1:25
    for ntest = 2:1:nbClasseMax
        [ Ver,~ ] = NormalizedSC_Jordan_Weiss( W, ntest ,0);
        [val,idx]=sort(Ver);
        Wcal = W(idx,idx);
        [A,~] = testClasse( ntest , val , Wcal);
        tmp(ntest) = A;
    end
    subplot(5,5,j)
    plot(tmp)
end
hold off

end

