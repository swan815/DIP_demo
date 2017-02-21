function varargout = chapter5(varargin)
% CHAPTER5 MATLAB code for chapter5.fig
%      CHAPTER5, by itself, creates a new CHAPTER5 or raises the existing
%      singleton*.
%
%      H = CHAPTER5 returns the handle to a new CHAPTER5 or the handle to
%      the existing singleton*.
%
%      CHAPTER5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER5.M with the given input arguments.
%
%      CHAPTER5('Property','Value',...) creates a new CHAPTER5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter5

% Last Modified by GUIDE v2.5 23-Dec-2016 15:57:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter5_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter5_OutputFcn, ...
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


% --- Executes just before chapter5 is made visible.
function chapter5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter5 (see VARARGIN)

% Choose default command line output for chapter5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
axis('off');
axes(handles.axes2);
axis('off');

% --- Outputs from this function are returned to the command line.
function varargout = chapter5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_snow.
function button_snow_Callback(hObject, eventdata, handles)
% hObject    handle to button_snow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
x= rgb2gray(x);
gaus = str2double(get(handles.text3,'string'));
g=imnoise(x,'gaussian',0.1,gaus); %加入高斯噪声
axes(handles.axes2);
axis('off');
imshow(g,[]),title('加入高斯噪声之后的图象'); 

% --- Executes on button press in button_salt.
function button_salt_Callback(hObject, eventdata, handles)
% hObject    handle to button_salt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
salt = str2double(get(handles.text2,'string'));
L=imnoise(I,'salt & pepper',salt); % 叠加密度为0.04的椒盐噪声
axes(handles.axes2);
axis('off');
imshow(L),title('加入加盐噪声的图像');
setappdata(gcf,'im1',L);

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
set(handles.text3,'String',num2str(val));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,5,ones(3,3));     %调用自编函数进行均值滤波，n为模板大小   
figure,imshow(Y2,[]),title('中值滤波后的图像');

% --- Executes on button press in button_Max.
function button_Max_Callback(hObject, eventdata, handles)
% hObject    handle to button_Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,9,ones(3,3));      
axes(handles.axes2);
figure,imshow(Y2,[]),title('最大值滤波后的图像');


% --- Executes on button press in button_Min.
function button_Min_Callback(hObject, eventdata, handles)
% hObject    handle to button_Min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,1,ones(3,3));     %调用自编函数进行均值滤波，n为模板大小   
axes(handles.axes2);
figure,imshow(Y2,[]),title('最小值滤波后的图像');

% --- Executes on button press in button_adapt.
function button_adapt_Callback(hObject, eventdata, handles)
% hObject    handle to button_adapt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(gcf,'im');
img=rgb2gray(img);
[m n]=size(img);

img=imnoise(img,'salt & pepper',0.1);   %加入椒盐噪声
figure;
imshow(img,[]);

Nmax=10;        %确定最大的滤波半径

%下面是边界扩展，图像上下左右各增加Nmax像素。
imgn=zeros(m+2*Nmax+1,n+2*Nmax+1);
imgn(Nmax+1:m+Nmax,Nmax+1:n+Nmax)=img;

imgn(1:Nmax,Nmax+1:n+Nmax)=img(1:Nmax,1:n);                 %扩展上边界
imgn(1:m+Nmax,n+Nmax+1:n+2*Nmax+1)=imgn(1:m+Nmax,n:n+Nmax);    %扩展右边界
imgn(m+Nmax+1:m+2*Nmax+1,Nmax+1:n+2*Nmax+1)=imgn(m:m+Nmax,Nmax+1:n+2*Nmax+1);    %扩展下边界
imgn(1:m+2*Nmax+1,1:Nmax)=imgn(1:m+2*Nmax+1,Nmax+1:2*Nmax);       %扩展左边界

re=imgn;
for i=Nmax+1:m+Nmax
    for j=Nmax+1:n+Nmax
        
        r=1;                %初始滤波半径
        while r~=Nmax
            W=imgn(i-r:i+r,j-r:j+r);
            W=sort(W);
            Imin=min(W(:));
            Imax=max(W(:));
            Imed=W(uint8((2*r+1)^2/2));
            if Imin<Imed && Imed<Imax       %如果当前邻域中值不是噪声点，那么就用此次的邻域
               break;
            else
                r=r+1;              %否则扩大窗口，继续判断
            end          
        end
        
        if Imin<imgn(i,j) && imgn(i,j)<Imax         %如果当前这个像素不是噪声，原值输出
            re(i,j)=imgn(i,j);
        else                                        %否则输出邻域中值
            re(i,j)=Imed;
        end
        
    end
end

figure;
imshow(re(Nmax+1:m+Nmax,Nmax+1:n+Nmax),[]);

function out=alpha(imm3) 
[m,n]=size(imm3);
out=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        im=imm3(i-1:i+1,j-1:j+1);
        im=sort(im(:));
        im=im(2:8);
        out(i,j)=sum(im(:))/7;
    end
end
% --- Executes on button press in button_aerfa.
function button_aerfa_Callback(hObject, eventdata, handles)
% hObject    handle to button_aerfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=alpha(g);     %调用自编函数进行均值滤波，n为模板大小   
axes(handles.axes2);
figure,imshow(Y2,[]),title('阿尔法滤波后的图像');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_nyb.
function btn_nyb_Callback(hObject, eventdata, handles)
% hObject    handle to btn_nyb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_hitmiss.
function button_hitmiss_Callback(hObject, eventdata, handles)
% hObject    handle to button_hitmiss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im'); 
f=x;
axes(handles.axes2);
imshow(f);
title('击中或不击中原始图像');
B1=strel([0 0 0;0 1 1;0 1 0]);%击中：要求击中所有1的位置
B2=strel([1 1 1;1 0 0;1 0 0]);%击不中，要求击不中所有1的位置
B3=strel([0 1 0;1 1 1;0 1 0]);%击中
B4=strel([1 0 1;0 0 0;0 0 0]);%击不中
B5=strel([0 0 0;0 1 0;0 0 0]);%击中
B6=strel([1 1 1;1 0 0;1 0 0]);%击不中
g=imerode(f,B1)&imerode(~f,B2)%利用定义来实现击中或击不中
figure,subplot(221),imshow(g);
title('定义实现组1击中击不中图像');
g1=bwhitmiss(f,B1,B2);
subplot(222),imshow(g1);
title('结构数组1击中击不中后的图像');
g2=bwhitmiss(f,B3,B4);
subplot(223),imshow(g2);
title('结构数组2击中击不中的图像');
g3=bwhitmiss(f,B5,B6);
subplot(224),imshow(g3);
title('结构数组3击中击不中的图像');

% --------------------------------------------------------------------
function M_FILE_Callback(hObject, eventdata, handles)
% hObject    handle to M_FILE (see GCBO)
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


% --- Executes during object creation, after setting all properties.
function button_adapt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to button_adapt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btn_imdilate.
function btn_imdilate_Callback(hObject, eventdata, handles)
% hObject    handle to btn_imdilate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im'); 
 A1=x;
B=[0 1 0
   1 1 1
  0 1 0];
A2=imdilate(A1,B);%图像A1被结构元素B膨胀
A3=imdilate(A2,B);
A4=imdilate(A3,B);
axes(handles.axes2);
subplot(221),imshow(A1);
title('imdilate膨胀原始图像');
subplot(222),imshow(A2);
title('使用B后1次膨胀后的图像');
subplot(223),imshow(A3);
title('使用B后2次膨胀后的图像');
subplot(224),imshow(A4);
title('使用B后3次膨胀后的图像');
figure,subplot(221),imshow(A1);
title('imdilate膨胀原始图像');
subplot(222),imshow(A2);
title('使用B后1次膨胀后的图像');
subplot(223),imshow(A3);
title('使用B后2次膨胀后的图像');
subplot(224),imshow(A4);
title('使用B后3次膨胀后的图像');
% --- Executes on button press in btn_imerode.
function btn_imerode_Callback(hObject, eventdata, handles)
% hObject    handle to btn_imerode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im'); 
 A1=x;
 axes(handles.axes2);
subplot(221),imshow(A1);
title('腐蚀原始图像');
%strel函数的功能是运用各种形状和大小构造结构元素
se1=strel('disk',5);%这里是创建一个半径为5的平坦型圆盘结构元素
A2=imerode(A1,se1);
subplot(222),imshow(A2);
title('使用结构原始disk(5)腐蚀后的图像');
se2=strel('disk',10);
A3=imerode(A1,se2);
subplot(223),imshow(A3);
title('使用结构原始disk(10)腐蚀后的图像');
se3=strel('disk',20);
A4=imerode(A1,se3);
subplot(224),imshow(A4);
title('使用结构原始disk(20)腐蚀后的图像');


% --- Executes on button press in btn_openclose.
function btn_openclose_Callback(hObject, eventdata, handles)
% hObject    handle to btn_openclose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im'); 
f=x;
 %se=strel('square',5');%方型结构元素
se=strel('disk',5');%圆盘型结构元素
%开运算数学上是先腐蚀后膨胀的结果
%开运算的物理结果为完全删除了不能包含结构元素的对象区域，平滑
%了对象的轮廓，断开了狭窄的连接，去掉了细小的突出部分
fo=imopen(f,se);%直接开运算
axes(handles.axes2);
imshow(fo,[]);
 title('直接开运算');
%闭运算在数学上是先膨胀再腐蚀的结果
%闭运算的物理结果也是会平滑对象的轮廓，但是与开运算不同的是，闭运算
%一般会将狭窄的缺口连接起来形成细长的弯口，并填充比结构元素小的洞
figure,subplot(221),imshow(fo,[]);
 title('直接开运算');
fc=imclose(f,se);%直接闭运算
subplot(222),imshow(fc);
title('直接闭运算');
foc=imclose(fo,se);%先开后闭运算
subplot(223),imshow(foc);
title('先开后闭运算');
fco=imopen(fc,se);%先闭后开运算
subplot(224),imshow(fco);
title('先闭后开运算');
%开闭运算结果如下：

% --- Executes on button press in btn_close.
function btn_close_Callback(hObject, eventdata, handles)
% hObject    handle to btn_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function btn_nyb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btn_nyb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
