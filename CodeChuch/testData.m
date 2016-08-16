function [ Ver ] = testData( X , nbClass , TabVer)
W = distance(X,7);
[ Ver,~ ] = NormalizedSC_Jordan_Weiss( W, nbClass  ,0);

TabVer = mod(TabVer,nbClass)+1;
V = perms(linspace(1,nbClass,nbClass));
tmp = 1000000;
ligne = 1;

Vtmp = zeros(size(Ver));

for i=1:1:size(V,1)
    for j=1:1:nbClass
         Vtmp(Ver==j)=V(i,j);  
    end
    
    if(tmp>sum(abs(Vtmp-TabVer)))
        ligne = i;
        tmp = sum(abs(Vtmp-TabVer));
    end
end



for j=1:1:nbClass
    Vtmp(Ver==j)=V(ligne,j);  
end

hold on
figure
subplot(2,1,1)
imagesc(Vtmp)
colormap(jet)
colorbar
title('Table de vérité calculée')
subplot(2,1,2)
imagesc(TabVer)
colormap(jet)
colorbar
title('Table de vérité exacte')

end

