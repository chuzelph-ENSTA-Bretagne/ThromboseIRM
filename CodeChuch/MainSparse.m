%%

close all
clear all
clc

%% Recuperation Image

file = dir('C:\Users\Chuch\Documents\MATLAB\PFE\Patient2\MR*');
Nout = length(file);
Sto = cell(Nout,1);
foldername = 'C:\Users\Chuch\Documents\MATLAB\PFE\Patient2\'; %'C:\Users\Chuch\Documents\MATLAB\PFE\ResultP1';

%%

if(true)
    
    fprintf('Commencement de la phase de recuperation de donnees\n')
    
    for k = 1 : Nout
        % obtention des data du fichier courant
        [X,map,alpha,overlays] = dicomread(fullfile(foldername,file(k).name));
        % On garde la variable M
        Sto{k} = X;
    end
    
    fprintf('Fin de la phase de recuperation de donnees\n')
    
end

%%

if(true)
    
    fprintf('Commencement de la phase de préparation des coupes\n')
    Ncoupe = floor(Nout/40);
    coupe = cell(Ncoupe,1);
    for k = 1 : Ncoupe
        % obtention des data du fichier courant
        tmp = zeros(128,128,40);
        for i=1:40
            tmp(:,:,i) =  Sto{(k-1)*40+i};
        end
        % On garde la variable M
        coupe{k} = tmp;
    end
    
    fprintf('Fin de la phase de préparation des coupes\n')
    
end


%%

coupeS = 18;


tmp = coupe{coupeS};
figure
imagesc(tmp(:,:,1))
mask = roipoly;
mask = mask + 0;
PointRet = find(mask==1);

file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , 40);
file = file1(PointRet,:)';

Min = min(file)';
Max = max(file)';

% remise a l'echelle

remise = true;
if(remise)
    m = Min*ones(size(file(:,1)'));
    m2 = (Max-Min)*ones(size(file(:,1)'));
    %file = cat(2,file',(file'-m)./m2);
    file = (file'-m)./m2;
else
    file=file';
end

figure
hold on
for i = 1:1:5
    for j=1:1:5
        subplot(5,5,5*(i-1)+j)
        plot(file((5*(i-1)+j-1)*floor(length(file)/25)+1:(5*(i-1)+j)*floor(length(file)/25),:))   
        xlabel('time')
        ylabel('Intensity')     
        axis('tight')
    end
end

hold off

A=[];
for i = 1:1:size(file,1)
    Xi = file([1:i-1 i+1:end],:)';
    xi = file(i,:)';
    [x,status]=l1_ls(Xi,xi,0.01,0.01);
    A=[A x];
    sprintf('taux avancement %d',100*i/size(file,1))
end

A = A';

A2 = zeros(size(file,1),size(file,1));

for i = 1:1:size(file,1)
    if(i~=size(A,1))
        A2(i,:) = [A(i,1:i-1) 0 A(i,i:end)];  
    else
        A2(i,:) = [A(i,:) 0];
    end
end

W=(abs(A2)+abs(A2)')/2;

%%

[ Ver,L,VectP,ValP ] = standard_SparseSC( W, 2  ,0);


figure('Name','Results of the spectral clustering on real data')

% result



subplot(3,1,1)
mask(PointRet)=Ver;
imagesc(mask)
title('Clustered image')
colormap(jet)
colorbar

subplot(3,2,3)
Vec1 = file(Ver==1,:);
hold on
for i = 1:1:length(Vec1)
    plot(Vec1(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 1')

subplot(3,2,4)
Vec2 = file(Ver==2,:);
hold on
for i = 1:1:length(Vec2)
    plot(Vec2(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 2')

subplot(3,2,5)
Vec3 = file(Ver==3,:);
hold on
for i = 1:1:length(Vec3)
    plot(Vec3(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 3')

subplot(3,2,6)
Vec4 = file(Ver==4,:);
hold on
for i = 1:1:length(Vec4)
    plot(Vec4(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 4')


hold off