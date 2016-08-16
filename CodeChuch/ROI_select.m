function [ PointRet , mask , file ] = ROI_select( Ncoupe , data )
    tmp = data{Ncoupe};
    figure
    imagesc(tmp(:,:,1))
    colormap(jet)
    mask = roipoly;
    mask = mask + 0;
    PointRet = find(mask==1);

    file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , 40);
    %file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , 20);
    file = file1(PointRet,:);
end

