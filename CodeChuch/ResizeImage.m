function [ In ] = ResizeImage( I , n )
Lig = 0:1:size(I,1)-1;
Col = 0:1:size(I,2)-1;
In = zeros(n*size(I,1),n*size(I,1));
for i =1:1:n
    for j=1:1:n
        In(Lig*n+i,Col*n+j)=I;
    end
end
figure
imagesc(In)
end

