function H = AffichageIRM( Aff4D , ~)
x = 0;
y = 0; 
xN = 0;
yN = 0;

tmin = 1;
tmax = size(Aff4D{1},3);
Smin = 1;
Smax = length(Aff4D);

t_init = 1;
Slice_init = 1;
pos2 = 0;
x0 = 0;
y0 = 0;

function WindowButtonDownFcn(~, ~)
        pos = get(gca, 'CurrentPoint') ;
        x0 = pos(1,1);
        y0 = pos(1,2);
        
        set(gcf, 'WindowButtonMotionFcn', @windowButtonMotionFcn) % On suit les mouvements de la souris
        set(gcf, 'WindowButtonUpFcn', @windowButtonUpFcn)         % On repère lorsque l'utlisateur relache le bouton
    end
    function windowButtonMotionFcn(~, ~)
        pos2 = get(gca, 'CurrentPoint');         % Position de la souris
        x = (pos2(1,1) - x0);
        y = (pos2(1,2) - y0);
        xN = min( max( x + t_init , tmin) , tmax);
        yN = min( max( y + Slice_init, Smin) , Smax);
        
        % test dans le cas on atteint le fond!
        if(xN > tmax)
            xN = tmax;
            x0 = pos2(1,1) + xN;
        end
        
        if(xN < tmin)
            xN = tmin;
            x0 = pos2(1,1) + xN;
        end
        
        if(yN > Smax)
            yN = Smax;
            y0 = pos2(1,2) + yN;
        end
        
        if(yN < Smin)
            yN = Smin;
            y0 = pos2(1,2) + yN;
        end
        xN
        yN
        imagesc(Aff4D{round(yN)}(:,:,round(xN)))
        set(gca,'visible','off')
        dim = [.2 .5 .3 .3];
        str = strcat('Slice : ',num2str(round(yN)));
        str2 = strcat('time : ',num2str(round(xN)));
        text(5,size(Aff4D{1},2)/2,str,'Color','red');
        text(5,size(Aff4D{1},2)/2+10,str2,'Color','red');
    end

    function windowButtonUpFcn(~, ~)
                                              % Le bouton a été relâché... 
        set(gcf, 'WindowButtonMotionFcn', '') % On ne suit plus les mouvements de la souris
        set(gcf, 'WindowButtonUpFcn', '')     % Ni le relâchement du bouton
        t_init = xN;
        Slice_init = yN;
    end

if(nargin==2)
    set(gcf, 'WindowButtonDownFcn', @WindowButtonDownFcn)
    set(gcf, 'WindowButtonMotionFcn', '')
    set(gcf, 'WindowButtonUpFcn', '')
    imagesc(Aff4D{Slice_init}(:,:,t_init))
    colormap(gray)
    set(gca,'visible','off')  
    H = 0;
else
    H = figure('WindowButtonDownFcn', @WindowButtonDownFcn,...
        'WindowButtonMotionFcn','',...
        'WindowButtonUpFcn','');  
    imagesc(Aff4D{Slice_init}(:,:,t_init))
    colormap(gray)
    set(gca,'visible','off')  
    
end


end