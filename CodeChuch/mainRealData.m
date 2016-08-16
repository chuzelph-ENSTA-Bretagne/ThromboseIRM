clear all
close all
clc

load('real131.mat')

W = distance(Vec_data_real,7);
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, 4  ,0);

figure('Name','Results of the spectral clustering on real data')
hold on

subplot(3,1,1)
Ver2 = reshape(Ver,91,61);
imagesc(Ver2)
title('Clustered image')

subplot(3,2,3)
Vec1 = Vec_data_real(Ver==1,:);
hold on
for i = 1:1:length(Vec1)
    plot(Vec1(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 1')

subplot(3,2,4)
Vec2 = Vec_data_real(Ver==2,:);
hold on
for i = 1:1:length(Vec2)
    plot(Vec2(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 2')

subplot(3,2,5)
Vec3 = Vec_data_real(Ver==3,:);
hold on
for i = 1:1:length(Vec3)
    plot(Vec3(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 3')

subplot(3,2,6)
Vec4 = Vec_data_real(Ver==4,:);
hold on
for i = 1:1:length(Vec4)
    plot(Vec4(i,:))
end
xlabel('time')
ylabel('Intensity')
title('Clustered 4')


hold off

%% Partie vidéo


fprintf('Résultat vidéo stocker dans RésultatScript.avi\n')
xout = VideoWriter('RésultatScript.avi');
xout.FrameRate = 10;
xout.Quality = 75;
open(xout);
figure
DataRS = reshape(Vec_data_real,91,61,20);
for i=1:1:20
    fig = imagesc(DataRS(:,:,i));
    title(strcat('image ',int2str(i)));
    saveas(fig, 'tmp', 'png');
    Im = imread('tmp.png');
    writeVideo(xout,Im)
end
close(xout);
fprintf('fin de la phase de video\n')