function varargout = chapter4(varargin)
% CHAPTER4 MATLAB code for chapter4.fig
%      CHAPTER4, by itself, creates a new CHAPTER4 or raises the existing
%      singleton*.
%
%      H = CHAPTER4 returns the handle to a new CHAPTER4 or the handle to
%      the existing singleton*.
%
%      CHAPTER4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER4.M with the given input arguments.
%
%      CHAPTER4('Property','Value',...) creates a new CHAPTER4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter4

% Last Modified by GUIDE v2.5 17-Dec-2016 23:28:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter4_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter4_OutputFcn, ...
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


% --- Executes just before chapter4 is made visible.
function chapter4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter4 (see VARARGIN)

% Choose default command line output for chapter4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis('off');
axes(handles.axes2);
axis('off');
axes(handles.axes3);
axis('off');
% --- Outputs from this function are returned to the command line.
function varargout = chapter4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_fly.
function button_fly_Callback(hObject, eventdata, handles)
% hObject    handle to button_fly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im=getappdata(gcf,'im');
imf=getappdata(gcf,'im');
imf = fftshift(fft2(imf));
imshow(imf,[]);
axes(handles.axes3);
axis('off');
imff=log(abs(imf));
imshow(imff,[]);
setappdata(gcf,'imo',imf);
setappdata(gcf,'img',im);

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
im=rgb2gray(im);
axes(handles.axes1);
axis('off');
imshow(im);

setappdata(gcf,'im',im);


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
p=get(gca,'CurrentPoint');
p=p(1,1:2);
y=ceil(p(1));
x=ceil(p(2));
im=getappdata(gcf,'img');
[m,n]=size(im);
if(x>0&&y>0&&x<=m&&y<=n)
    imf=fftshift(fft2(im));
    imf(x,y)=imf(x,y)*5000;
    imn=ifft2(imf);
    axes(handles.axes2);
    imshow(abs(imn),[]);
else
    axes(handles.axes2);
    imshow(im,[]);
end


% --------------------------------------------------------------------
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
syl201400800391
