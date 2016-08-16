function [ mat ] = cellSTR2mat( C )
L = length(C);
mat=zeros(L,1);
for i = 1:L
    mat(i)=str2double(C{i});
end


end

