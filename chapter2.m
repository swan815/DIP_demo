function varargout = chapter2(varargin)
% CHAPTER2 MATLAB code for chapter2.fig
%      CHAPTER2, by itself, creates a new CHAPTER2 or raises the existing
%      singleton*.
%
%      H = CHAPTER2 returns the handle to a new CHAPTER2 or the handle to
%      the existing singleton*.
%
%      CHAPTER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2.M with the given input arguments.
%
%      CHAPTER2('Property','Value',...) creates a new CHAPTER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter2

% Last Modified by GUIDE v2.5 17-Dec-2016 23:05:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter2_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter2_OutputFcn, ...
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


% --- Executes just before chapter2 is made visible.
function chapter2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter2 (see VARARGIN)

% Choose default command line output for chapter2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis('off');
axes(handles.axes2);
axis('off');
% --- Outputs from this function are returned to the command line.
function varargout = chapter2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function M_FILE_Callback(hObject, eventdata, handles)
% hObject    handle to M_FILE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_FILE_OPEN_Callback(hObject, eventdata, handles)
% hObject    handle to M_FILE_OPEN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
{'*.bmp;*.jpg;*.gif;*.tif','Image Files (*.bmp,*.jpg,*.gif,*.tif)'},'Pick a file');

im=imread([pathname,filename]);
axes(handles.axes1);
imshow(im);
setappdata(gcf,'im',im);
 


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text2,'String',num2str(val)); 

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text5,'String',num2str(val));  


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function [J]=move(I,a,b)
[M,N]=size(I);
J=I;
   for i=1:M
       for j=1:N
           if(i-a>0)&&(j-b>0)&&(j-b<N)
               J(i,j)=I(i-a,j-b);
           else
               J(i,j)=0;
           end
       end
   end
% --- Executes on button press in button_Move.
function button_Move_Callback(hObject, eventdata, handles)
% hObject    handle to button_Move (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
a=str2double(get(handles.editX,'String'));
b=str2double(get(handles.editY,'String'));
J=move(I,a,b);
axes(handles.axes2);
imshow(J,[]);

function [J] = mirror(I,n)
[M,N]=size(I);
J=I;
if(n==1)
    for i=1:M
        for j=1:N
            J(i,j)=I(M-i+1,j);
        end
    end
elseif(n==2)
    for i=1:M
        for j=1:N
            J(i,j)=I(i,N-j+1);
        end
    end
elseif(n==3)
    for i=1:M
        for j=1:N
            J(i,j)=I(M-i+1,N-j+1);
        end
    end
    else
        error('n is wrong');
end
% --- Executes on button press in button_Mirror.
function button_Mirror_Callback(hObject, eventdata, handles)
% hObject    handle to button_Mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
axes(handles.axes2);
subplot(2,2,1);
imshow(I);
title('Ô­Í¼Ïñ');
J1=mirror(I,1);
J2=mirror(I,2);
J3=mirror(I,3);
subplot(2,2,2);
imshow(J1);
title('Ë®Æ½¾µÏñ');
subplot(2,2,3);
imshow(J2);
title('´¹Ö±¾µÏñ');
subplot(2,2,4);
imshow(J3);
title('Ë®Æ½¾µÏñµÄ´¹Ö±¾µÏñ');

% --- Executes on button press in button_Rotate.
function button_Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to button_Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[M,N]=size(I);
ang=str2double(get(handles.text2,'string'));
J=I;
for i=1:M
    for j=1:N
        x=floor(i*cos(ang*pi/180)-j*sin(ang*pi/180));
        y=floor(j*cos(ang*pi/180)-i*sin(ang*pi/180));
        if(x<M)&&(y<N)&&(x>0)&&(y>0)
            J(i,j)=I(x,y);
        else
            J(i,j)=0;
        end
    end
end
axes(handles.axes2);
imshow(J);
title('Í¼ÏñÐý×ª');

% --- Executes on button press in button_Small.
function button_Small_Callback(hObject, eventdata, handles)
% hObject    handle to button_Small (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
a=str2double(get(handles.text5,'string'));
times=a;
img4=imresize(I,times);
axes(handles.axes2);
imshow(img4);
figure,imshow(img4);
title('Í¼ÏñËõ·Å');


function editX_Callback(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editX as text
%        str2double(get(hObject,'String')) returns contents of editX as a double


% --- Executes during object creation, after setting all properties.
function editX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editY_Callback(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editY as text
%        str2double(get(hObject,'String')) returns contents of editY as a double


% --- Executes during object creation, after setting all properties.
function editY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
syl201400800391
