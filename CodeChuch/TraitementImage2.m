%%

close all
clear all
clc

%% Recuperation Image

file = dir('C:\Users\Chuch\Documents\MATLAB\PFE\Patient3\MR*');
Nout = length(file);
Sto = cell(Nout,1);
foldername = 'C:\Users\Chuch\Documents\MATLAB\PFE\Patient3\'; %'C:\Users\Chuch\Documents\MATLAB\PFE\ResultP1';

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
    Ncoupe = floor(Nout/45);
    coupe = cell(Ncoupe,1);
    for k = 1 : Ncoupe
        % obtention des data du fichier courant
        tmp = zeros(128,128,45);
        for i = 1:1:45
            tmp(:,:,i) =  Sto{(i-1)*Ncoupe+k};
        end
        % On garde la variable M
        coupe{k} = tmp;
    end
    
    fprintf('Fin de la phase de préparation des coupes\n')
    
end

%%

if(true)
    fprintf('Commencement de la phase de préparation des videos\n')
    
    for k = 1 : Ncoupe
        
        name = strcat(strcat('C:\Users\Chuch\Documents\MATLAB\PFE\Patient3\videoOut',int2str(k)),'.avi');
        xout = VideoWriter(name);
        xout.FrameRate = 3;
        xout.Quality = 75;
        open(xout);
        figure
        for i=1:1:21
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

%%

coupeS = 15;


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

remise = false;
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
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 2  ,0);


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

%% petit test


% n = 2
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 2  ,0);
[ nmod2 , modI] = Nmod( W,Ver );


% n = 3
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 3  ,0);
[ nmod3 , modI] = Nmod( W,Ver );

% n = 4
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 4  ,0);
[ nmod4 , modI] = Nmod( W,Ver );

% n = 5
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 5 ,0);
[ nmod5 , modI] = Nmod( W,Ver );

% n = 6
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 6 ,0);
[ nmod6 , modI] = Nmod( W,Ver );

%% 3D

coupeS = 7;
nbE = 2;
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

W = distance(fileTot,7);
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 3  ,0);

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

Aff = zeros(128,128,floor(Nout/40));

for i = coupeS-nbE:coupeS+nbE
    Aff(:,:,i) = mask{i-coupeS+nbE+1};
end

tmp = vis3d(Aff,colormap(jet))



%% 4D

Aff4D = zeros(128,128,length(coupe),45);
for i = 1:length(coupe)
    Aff4D(:,:,i,:)=coupe{i};
end

vis4d(Aff4D,colormap(jet))

%% sauvegarde des données


save('DataPatient2.mat','Aff4D','Aff');