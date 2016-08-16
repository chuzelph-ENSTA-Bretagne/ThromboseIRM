close all
clear all
clc


%%

load('DCTQ.mat')
I1 = imread('4.2.03.tiff');
figure
imshow(I1)
axis image;
I2 = imread('4.2.04.tiff');
figure
imshow(I2)
axis image;


%% YCrCy

[Y1]=rgb2ycbcr(I1);

[Y2]=rgb2ycbcr(I2);

%% Keep only channel Y

GrayMandrill = Y1(:,:,1);
GrayLena =  Y2(:,:,1);
figure; colormap(gray(256));image(GrayMandrill);axis image;
figure; colormap(gray(256));image(GrayLena);axis image;

%%

sizeblock = 8;
[ tab ] = SplitImage( GrayLena , sizeblock);

[ tabSplit ] = DCTSplitImage( tab ,sizeblock,size(tab,3),size(tab,4));

%% 

r = 1;
T = r*DCTQ;

%%

[ Y ] = quantization( tabSplit , T );


%%

[ itabSplit ] = iDCTSplitImage( Y ,sizeblock,size(tab,3),size(tab,4),T);
[ Inew ] = mergeImage( itabSplit ,sizeblock,size(tab,3),size(tab,4) );
figure; colormap(gray(256));image(Inew);axis image;

%% Fonction sparse matrix  sparse et full


%%