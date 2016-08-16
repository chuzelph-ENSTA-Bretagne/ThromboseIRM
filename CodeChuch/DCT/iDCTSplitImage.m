function [ itabSplit ] = iDCTSplitImage( tabSplit ,sizeBlock,l,L,T)
itabSplit = zeros(sizeBlock, sizeBlock,l,L);

for i =0:1:l-1
    for j=0:1:L-1
        itabSplit(:,:,i+1,j+1)=uint8(idct2(tabSplit(:,:,i+1,j+1).*T));
    end
end


end

