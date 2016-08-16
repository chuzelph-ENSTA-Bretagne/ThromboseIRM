function varargout = InterfaceAff(varargin)
% INTERFACEAFF MATLAB code for InterfaceAff.fig
%      INTERFACEAFF, by itself, creates a new INTERFACEAFF or raises the existing
%      singleton*.
%
%      H = INTERFACEAFF returns the handle to a new INTERFACEAFF or the handle to
%      the existing singleton*.
%
%      INTERFACEAFF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACEAFF.M with the given input arguments.
%
%      INTERFACEAFF('Property','Value',...) creates a new INTERFACEAFF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfaceAff_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfaceAff_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfaceAff

% Last Modified by GUIDE v2.5 07-Jul-2016 13:07:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfaceAff_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfaceAff_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InterfaceAff is made visible.
function InterfaceAff_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfaceAff (see VARARGIN)

% Choose default command line output for InterfaceAff
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfaceAff wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfaceAff_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
global current_name
[filename, pathname] = uigetfile( ...
{'*.m;*.mlx;*.fig;*.mat;*.slx;*.mdl',...
 'MATLAB Files (*.m,*.mlx,*.fig,*.mat,*.slx,*.mdl)';
   '*.m;*.mlx',  'Code files (*.m,*.mlx)'; ...
   '*.fig','Figures (*.fig)'; ...
   '*.mat','MAT-files (*.mat)'; ...
   '*.mdl;*.slx','Models (*.slx, *.mdl)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file');
current_name = strcat(pathname,filename);
PatientData = load(strcat(pathname,filename));
axes(handles.axes1);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
Aff4D = zeros(128,128,length(PatientData.coupe),size(PatientData.coupe{1},3));
for i = 1:length(PatientData.coupe)
    Aff4D(:,:,i,:)=PatientData.coupe{i};
end
axes(handles.axes1);
vis4d(Aff4D,colormap(jet))



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
 
num = str2double(get(hObject,'String'));
if isnan(num)
    num = 0;
    set(hObject,'String',num);
    errordlg('Input must be a number', 'Error')
end
handles.edit1 = num;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
tmp = PatientData.coupe{handles.edit1};
axes(handles.axes1);
imagesc(tmp(:,:,1))
mask = roipoly;
mask = mask + 0;
PointRet = find(mask==1);

file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , size(PatientData.coupe{1},3));
file = file1(PointRet,:)';

Min = min(file)';
Max = max(file)';

% remise a l'echelle
handles.popupmenu1
if(handles.popupmenu1)
    m = Min*ones(size(file(:,1)'));
    m2 = (Max-Min)*ones(size(file(:,1)'));
    file = (file'-m)./m2;
else
    file=file';
end

axes(handles.axes1);
W = distance(file,7);
[ Ver,L,VectP,ValP ] = NormalizedSC_Jordan_Weiss( W, handles.edit3 ,0);
mask(PointRet)=Ver;
imagesc(mask)
colormap(jet)
% colorbar
global map
map = mask



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
num = str2double(get(hObject,'String'));
if isnan(num)
    num = 0;
    set(hObject,'String',num);
    errordlg('Input must be a number', 'Error')
end
handles.edit2 = num;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
case 'Avec' % User selects peaks.
   handles.popupmenu1 = true;
case 'Sans' % User selects membrane.
   handles.popupmenu1 = false;
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
global CBV
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
tmp = PatientData.coupe{handles.edit1};
axes(handles.axes1);
imagesc(tmp(:,:,1))
mask = roipoly;
mask = mask + 0;
PointRet = find(mask==1);
file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , size(PatientData.coupe{1},3));
file = file1(PointRet,:);
S = transverse_relaxation_rate( file , 40 ); % temps echo!!!
CBV = zeros(size(tmp(:,:,1)));
CBV(PointRet)=S;
axes(handles.axes1);
imagesc(CBV)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
global CBF
global CBV
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
tmp = PatientData.coupe{handles.edit2};
axes(handles.axes1);
imagesc(tmp(:,:,1))
mask = roipoly;
mask = mask + 0;
PointRet = find(mask==1);


file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , size(PatientData.coupe{1},3));
file = file1(PointRet,:)';

Sc = mean(file');  % Label de l'artere


coupeS = 17;
tmp = PatientData.coupe{handles.edit1};
file1 = reshape(tmp , size(tmp,1)*size(tmp,2) , size(PatientData.coupe{1},3));

Q = [];
for i= 1:1:length(file1)
    [q,r] = deconv(file1(i,:),Sc);
    Q = [Q q];
end

%figure
MTT = reshape(Q , size(tmp,1),size(tmp,2));
%imagesc(MTT)

axes(handles.axes1);
CBF = CBV./MTT;
imagesc(CBF)

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global CBF
global CBV
global map
global PatientData
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
figure
tmp = PatientData.coupe{handles.edit1};

subplot(1,3,1)
imagesc(tmp(:,:,1))
%set(gca,'visible','off')
title('IRM Image')

subplot(1,3,2)
imagesc(CBV)
title('CBV')
%set(gca,'visible','off')

subplot(1,3,3)
imagesc(map)
%set(gca,'visible','off')
title('Algorithm result')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
AffichageCourbe( PatientData.coupe , handles.edit1 , handles.axes1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PatientData
set(gcf, 'WindowButtonDownFcn', '')
set(gcf, 'WindowButtonMotionFcn', '')
set(gcf, 'WindowButtonUpFcn', '')
AffichageIRM( PatientData.coupe, handles.axes1);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
num = str2double(get(hObject,'String'));
if isnan(num)
    num = 0;
    set(hObject,'String',num);
    errordlg('Input must be a number', 'Error')
end
handles.edit3 = num;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
