
function newfig(src,evnt)
    fh_cb = @newfig; % Create function handle for newfig function
    figure('ButtonDownFcn',fh_cb);

   if strcmp(get(src,'SelectionType'),'alt')
      figure('ButtonDownFcn',fh_cb)
   else
      disp('Use control-click to create a new figure')
   end
end
