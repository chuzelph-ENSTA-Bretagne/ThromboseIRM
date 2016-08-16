function [ Y ] = quantization( tabSplit , T )

Y = zeros(size(tabSplit));

for i =0:1:size(tabSplit,3)-1
    for j=0:1:size(tabSplit,4)-1
        Y(:,:,i+1,j+1)=(round((tabSplit(:,:,i+1,j+1))./T));
    end
end


end

