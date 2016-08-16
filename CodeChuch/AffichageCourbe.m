function H =  AffichageCourbe( Aff4D , Slice , ~)

function buttonUpCallback(~, ~)
        %close(gcf);
end

function WindowButtonDownFcn(obj,evt)
        pos = get(gca, 'CurrentPoint');  % Position de la souris
        figure(); %figure('KeyPressFcn',@(obj,evt)close(gcf));
        plot(reshape(Aff4D{Slice}(round(pos(1,1)),round(pos(1,2)),:),1,size(Aff4D{Slice},3)))
end



if(nargin==3)
    set(gcf, 'WindowButtonDownFcn', @WindowButtonDownFcn)
    set(gcf, 'WindowButtonMotionFcn', '')
    set(gcf, 'WindowButtonUpFcn', @buttonUpCallback)
    imagesc(Aff4D{Slice}(:,:,1))
    colormap(gray)
    set(gca,'visible','off')  
    H = 0;
else
    H = figure('WindowButtonDownFcn', @WindowButtonDownFcn,...
        'WindowButtonMotionFcn','',...
        'WindowButtonUpFcn',@buttonUpCallback);  
    imagesc(Aff4D{Slice}(:,:,1))
    colormap(gray)
    set(gca,'visible','off')  
    
end

end

