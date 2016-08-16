%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     
%           Identification  et  Caract�risation  de la thrombose          
%                           grace aux IRMs                                
%                 Code pour la classification Spectrale                   
%                           Fait par Chuch.                               
%
% script qui permet d'�valuer le nombre de classe selon la r�ff�rence
% ci-dessous.
% ref : Self-Tuning Spectral Clustering, Manor et Perona
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


run main

%% extraie toutes les vp nec�ssaire

global VectP
n = 10;
[VectP,ValP] = eigs(L,n,0);


%% donne la fonction de cout pour la fonction fminunc
fun = @test;

%% les r�sultats sont plac�s dans des cellules
nbIter = 25;
A = cell(4,nbIter);


%% r�alise nbIter it�ration pour voir l'�volution de la fonction de cout en fonction du nombre de classe


for i=1:1:nbIter
    x0=mod(randn(1,n*(n-1)/2),pi/2);
    option=optimset('MaxFunEvals',100000,'MaxIter',10000);
    [x,fval,exitflag,output] = fminunc(fun,x0,option);
    A{1,i}=x;
    A{2,i}=fval;
    A{3,i}=exitflag;
    A{4,i}=output;
    
    R = RotFunc( x );
    Z = VectP*R;
    AffichageCalcClass( Z , n )
end



