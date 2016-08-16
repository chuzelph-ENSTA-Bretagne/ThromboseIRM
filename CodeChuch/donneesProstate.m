%%

close all
clear all
clc

%% Recuperation Image

file = dir('C:\Users\Chuch\Documents\MATLAB\PFE\Données Prostate\patient 1\IM*');
Nout = length(file);
Sto = cell(Nout,1);
foldername = 'C:\Users\Chuch\Documents\MATLAB\PFE\Données Prostate\patient 1\'; %'C:\Users\Chuch\Documents\MATLAB\PFE\ResultP1';

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
    Ncoupe = floor(Nout/20);
    coupe = cell(Ncoupe,1);
    for k = 1 : Ncoupe
        % obtention des data du fichier courant
        tmp = zeros(256,256,20);
        for i=1:20
            tmp(:,:,i) =  Sto{(k-1)*20+i};
        end
        % On garde la variable M
        coupe{k} = tmp;
    end
    
    fprintf('Fin de la phase de préparation des coupes\n')
    
end

%%


if(false)
    fprintf('Commencement de la phase de préparation des videos\n')
    
    for k = 1 : Ncoupe
        
        name = strcat(strcat('C:\Users\Chuch\Documents\MATLAB\PFE\Données Prostate\patient 1\videoOut',int2str(k)),'.avi');
        xout = VideoWriter(name);
        xout.FrameRate = 3;
        xout.Quality = 75;
        open(xout);
        figure
        for i=1:1:20
            fig = imagesc(coupe{k}(:,:,i));
            title(strcat('image ',int2str(i)));
            saveas(fig, 'tmp', 'png');
            Im = imread('tmp.png');
            writeVideo(xout,Im)
        end
        close(xout);
        
    end
    fprintf('Fin de la phase de préparation des videos\n')
end

%% 4D

Aff4D = zeros(256,256,length(coupe),20);
for i = 1:length(coupe)
    Aff4D(:,:,i,:)=coupe{i};
end

vis4d(Aff4D,colormap(gray))

%%

coupeS = 7;


tmp = coupe{coupeS};
figure
imagesc(tmp(:,:,1))
mask = roipoly;
mask = mask + 0;
PointRet = find(mask==1);

file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , 20);
file = file1(PointRet,:)';

Min = min(file)';
Max = max(file)';

% remise a l'echelle

remise = true;
if(remise)
    m = Min*ones(size(file(:,1)'));
    m2 = (Max-Min)*ones(size(file(:,1)'));
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
    end
end




hold off

W = distance(file,7);
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 3 ,0);


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

figure

subplot(2,2,1)
imagesc(mask)
title('Clustered image')
colormap(jet)
colorbar

subplot(2,2,2)
imagesc( coupe{coupeS}(:,:,5))
title('Image choisie')
colorbar

subplot(2,2,3)
imagesc( ((mask>0)+0).* coupe{coupeS}(:,:,5))
title('Segment choisi')
colorbar

%% 3D

coupeS = 7;
nbE = 1;
mask = cell(2*nbE+1,1);
PointRet = cell(2*nbE+1,1);
file = cell(2*nbE+1,1);


for i = coupeS-nbE:coupeS+nbE
	[ PointRet{i-coupeS+nbE+1} , mask{i-coupeS+nbE+1} , file{i-coupeS+nbE+1} ] = ROI_select( i , coupe );  
end

fileTot = [];
for i =1:2*nbE+1
    fileTot = cat(1,fileTot,file{i});
end

% remise a l'echelle
fileTot = fileTot';

Min = min(fileTot)';
Max = max(fileTot)';

remise = true;
if(remise)
    m = Min*ones(size(fileTot(:,1)'));
    m2 = (Max-Min)*ones(size(fileTot(:,1)'));
    fileTot = (fileTot'-m)./m2;
else
    fileTot=fileTot';
end


W = distance(fileTot,7);
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 2  ,0);

j = 1;
Ncoupe_up = 1;
for i =1:length(Ver)
    if(j>length(PointRet{Ncoupe_up}))
        Ncoupe_up = Ncoupe_up+1;
        j=1;
    end
    mask{Ncoupe_up}(PointRet{Ncoupe_up}(j))=Ver(i);
    j=j+1;
end

sprintf('affichage en 3d des résultats')

Aff = zeros(256,256,floor(Nout/20));

for i = coupeS-nbE:coupeS+nbE
    Aff(:,:,i) = mask{i-coupeS+nbE+1};
end

tmp = vis3d(Aff,colormap(jet))

figure

subplot(2,2,1)
Vec1 = fileTot(Ver==1,:);
hold on
for i = 1:1:length(Vec1)
    plot(Vec1(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 1')

subplot(2,2,2)
Vec2 = fileTot(Ver==2,:);
hold on
for i = 1:1:length(Vec2)
    plot(Vec2(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 2')

subplot(2,2,3)
Vec3 = fileTot(Ver==3,:);
hold on
for i = 1:1:length(Vec3)
    plot(Vec3(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 3')

subplot(2,2,4)
Vec4 = fileTot(Ver==4,:);
hold on
for i = 1:1:length(Vec4)
    plot(Vec4(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 4')

hold off


%% 4D

Aff4D = zeros(128,128,length(coupe),40);
for i = 1:length(coupe)
    Aff4D(:,:,i,:)=coupe{i};
end

vis4d(Aff4D,colormap(jet))