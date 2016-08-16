function [ Inew ] = mergeImage( itabSplit ,sizeBlock,l,L )

Inew = zeros(sizeBlock*l,sizeBlock*L);
for i =0:1:l-1
    for j=0:1:L-1
        Inew( (i*sizeBlock+1):(i+1)*sizeBlock,(j*sizeBlock+1):(j+1)*sizeBlock)=itabSplit(:,:,i+1,j+1);
    end
end

end

