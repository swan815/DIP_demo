function varargout = chapter6(varargin)
% CHAPTER6 MATLAB code for chapter6.fig
%      CHAPTER6, by itself, creates a new CHAPTER6 or raises the existing
%      singleton*.
%
%      H = CHAPTER6 returns the handle to a new CHAPTER6 or the handle to
%      the existing singleton*.
%
%      CHAPTER6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER6.M with the given input arguments.
%
%      CHAPTER6('Property','Value',...) creates a new CHAPTER6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter6

% Last Modified by GUIDE v2.5 23-Dec-2016 17:13:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter6_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter6_OutputFcn, ...
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


% --- Executes just before chapter6 is made visible.
function chapter6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter6 (see VARARGIN)

% Choose default command line output for chapter6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes1);
axis('off');
axes(handles.axes2);
axis('off');

% --- Outputs from this function are returned to the command line.
function varargout = chapter6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function M_File_Callback(hObject, eventdata, handles)
% hObject    handle to M_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
syl201400800391

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


% --- Executes on button press in btn_hisavg.
function btn_hisavg_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hisavg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=rgb2hsv(getappdata(gcf,'im'));
img1(:,:,1)=histeq(img1(:,:,1));
img1(:,:,2)=histeq(img1(:,:,2));
img1(:,:,3)=histeq(img1(:,:,3));
axes(handles.axes2);
imshow(hsv2rgb(img1));


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
k=get(handles.slider1,'value');
if(k<10) 
    k=1/(10-k);
else
    k=k-10;
end
if (k==0) 
    k=1;
end  
set(handles.text_show,'String',num2str(k));
k=str2double(get(handles.text_show,'string'));
img1=getappdata(gcf,'im');
img2(:,:,1)=img1(:,:,1)*k;
img2(:,:,2)=img1(:,:,2)*k;
img2(:,:,3)=img1(:,:,3)*k;
axes(handles.axes2);
imshow(img2,[]);
setappdata(gcf,'imgnew',img2);

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
k=get(handles.slider2,'value');
if(k<10) 
    k=1/(10-k);
else
    k=k-10;
end
if (k==0) 
    k=1;
end
set(handles.text5,'String',num2str(k));
k=str2double(get(handles.text5,'string'));
img1=rgb2hsv(getappdata(gcf,'im'));
img1(:,:,3)=img1(:,:,3)*k;
img1=hsv2rgb(img1);
axes(handles.axes2);imshow(img1);
setappdata(gcf,'imgnew',img1);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(gcf,'im');
p=get(gca,'CurrentPoint');
p=p(1,1:2);
y=ceil(p(1));
x=ceil(p(2));
r=img1(x,y,1);
g=img1(x,y,2);
b=img1(x,y,3);
[m,n,d]=size(img1);
for i=1:m
    for j=1:n
        img2(i,j,1)=0;
        img2(i,j,2)=0;
        img2(i,j,3)=0;
        r1=img1(i,j,1);
        g1=img1(i,j,2);
        b1=img1(i,j,3);
        if(r1<=r+30&&r1>=r-30&&g1<=g+30&&g1>=g-30&&b1<=b+30&&b1>=b-30)
        else
            img1(i,j,:)=0;
        end
    end
end
axes(handles.axes2);imshow(img1,[]);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img1=getappdata(gcf,'im');
img1=rgb2hsv(getappdata(gcf,'im'));
axes(handles.axes2);imshow(img1);