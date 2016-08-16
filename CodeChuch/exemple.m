function exemple
x = 1:10;
y = rand(1,10);
handlePlot = plot(x, y, 'r-o',...
    'ButtonDownFcn', @buttonDownFcn); % Ex�cution de buttonDownFcn() � chaque clic sur la courbe
title('Cliquez-d�placez les points de la courbe')
idx = [];
 
    function buttonDownFcn(~, ~)
        pos = get(gca, 'CurrentPoint');                           % Position de la souris
        [~,idx] = min( abs(pos(1,1)-x)+abs(pos(1,2)-y) );         % Indice du point le plus proche de la souris
        set(gcf, 'WindowButtonMotionFcn', @windowButtonMotionFcn) % On suit les mouvements de la souris
        set(gcf, 'WindowButtonUpFcn', @windowButtonUpFcn)         % On rep�re lorsque l'utlisateur relache le bouton
    end
    function windowButtonMotionFcn(~, ~)
        pos = get(gca, 'CurrentPoint');         % Position de la souris
        x(idx) = pos(1,1);                      % Mise � jour de l'abscisse du point
        y(idx) = pos(1,2);                      % Mise � jour de l'ordonn�e du point
        set(handlePlot, 'XData', x, 'YData', y) % Mise � jour du trac�
    end
    function windowButtonUpFcn(~, ~)
                                              % Le bouton a �t� rel�ch�... 
        set(gcf, 'WindowButtonMotionFcn', '') % On ne suit plus les mouvements de la souris
        set(gcf, 'WindowButtonUpFcn', '')     % Ni le rel�chement du bouton
    end
end