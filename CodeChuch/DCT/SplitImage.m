function [ tab ] = SplitImage( I , sizeBlock)

% trouver le nombre de block pour toute l'image

l = size(I,1);
L = size(I,2);

nbl = ceil(l/sizeBlock);
nbL = ceil(L/sizeBlock);

% zero padding si necessaire
Im = zeros(nbl*sizeBlock,nbL*sizeBlock);
Im(1:l,1:L)=I(1:l,1:L);

% variable qui sert à stocker les imagettes
tab = zeros(sizeBlock,sizeBlock,nbl,nbL);

for i =0:1:nbl-1
    for j=0:1:nbL-1
        tab(:,:,i+1,j+1)=Im( (i*sizeBlock+1):(i+1)*sizeBlock,(j*sizeBlock+1):(j+1)*sizeBlock);
    end
end

end

