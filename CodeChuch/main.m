%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               PFE :                                     %
%           Identification  et  Caractérisation  de la thrombose          %
%                           grace aux IRMs                                %
%                 Code pour la classification Spectrale                   %
%                           Fait par Chuch.                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%%%%%% variable globale, c'est immonde mais on en a besoin ;)
global VectP

%%***********************************************************************%%
% script test qui permet de tester les principaux algorithmes.
%%***********************************************************************%%

%% Génération des données

rayon = 5;
nbPoint = 500;
nbClass = 4;
Noise = 0.005;
[x0,y0] = genPoint(5,nbPoint,Noise); 
[x1,y1] = genPoint(4,nbPoint,Noise);
[x2,y2] = genPoint(3,nbPoint,Noise);
[x3,y3] = genPoint(2,nbPoint,Noise);
X = horzcat(x0,x1,x2,x3);
Y = horzcat(y0,y1,y2,y3);
affichage( X,Y )
Xt = cat(1,X,Y)';


% x0 = Noise*randn(2,nbPoint)+diag([5;5])*ones(2,nbPoint);%genPoint(5,nbPoint,Noise); 
% x1 = Noise*randn(2,nbPoint)+diag([5;-2])*ones(2,nbPoint);%genPoint(4,nbPoint,Noise);
% x2 = Noise*randn(2,nbPoint)+diag([0;3])*ones(2,nbPoint);%genPoint(3,nbPoint,Noise);
% x3 = Noise*randn(2,nbPoint)+diag([-5;4])*ones(2,nbPoint);%genPoint(2,nbPoint,Noise);
% X = horzcat(x0,x1,x2,x3);
% Xt = X';

%% table de vérité réelle

Ver = cat(1,ones(nbPoint,1),2*ones(nbPoint,1),3*ones(nbPoint,1),4*ones(nbPoint,1));
affichageVerite( Xt(:,1),Xt(:,2),Ver )
title('exemple de données à classifier')
xlabel('x')
ylabel('y')

%% Impact du kmeans sans traitement

Ver = kmeans(Xt,4);
affichageVerite( Xt(:,1),Xt(:,2),Ver )
title('Impact de l''utilisation immédiate du kmeans')
xlabel('x')
ylabel('y')

%% Ajout de permutation aléatoire + calcule de la matrice de voisinage
Wvrai = distance(Xt,7);
Alea = randperm(nbClass*nbPoint);
XtAlea = Xt(Alea,:);
W = distance(XtAlea,7);
figure
imshow(W)
colormap(jet)

%% Choix de l'algorithme de classification spectrale

%[ Ver,L,VectP,ValP ] = UnnormalizedSC( W, nbClass );
%[ Ver,L,VectP,ValP ] = NormalizedSC_SHI_MALIK( W, nbClass );
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, nbClass  ,0);

%% Affichage des résultats de la classification et obtention de la matrices de voisinage réorganisée


affichageVerite( XtAlea(:,1),XtAlea(:,2),Ver )
title('Effet de l''algorithme de classification')
xlabel('x')
ylabel('y')

[val,idx]=sort(Ver);
Wcal = W(idx,idx);



%% test pour le nombre de classe

%nbClasseMax = 5;
%nbClassOpti( nbClasseMax , W )

%% Sparse

A=[];
for i = 1:1:size(XtAlea,1)
    Xi = XtAlea([1:i-1 i+1:end],:)';
    xi = XtAlea(i,:)';
    [x,status]=l1_ls(Xi,xi,0.01,0.01);
    A=[A x];
    sprintf('taux avancement %d',100*i/size(XtAlea,1))
end


A2 = zeros(size(XtAlea,1),size(XtAlea,1));

for i = 1:1:size(XtAlea,1)
    if(i~=size(XtAlea,1))
        A2(i,:) = [A(i,1:i-1) 0 A(i,i:end)]; 
    else
        A2(i,:) = [A(i,:) 0];
    end
end

W=(abs(A2)+abs(A2)')/2;
imagesc(W)
[ Ver,L,VectP,ValP ] = standard_SparseSC( W, nbClass  ,0);

affichageVerite( XtAlea(:,1),XtAlea(:,2),Ver )
title('Effet de l''algorithme de classification')
xlabel('x')
ylabel('y')

[val,idx]=sort(Ver);
Wcal = W(idx,idx);
imagesc(Wcal)