function [ tabSplit ] = DCTSplitImage( tab ,sizeBlock,l,L)
tabSplit = zeros(sizeBlock, sizeBlock,l,L);

for i =0:1:l-1
    for j=0:1:L-1
        tabSplit(:,:,i+1,j+1)=dct2(tab(:,:,i+1,j+1));
    end
end


end

