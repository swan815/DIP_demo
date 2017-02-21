function varargout = syl201400800391(varargin)
% SYL201400800391 MATLAB code for syl201400800391.fig
%      SYL201400800391, by itself, creates a new SYL201400800391 or raises the existing
%      singleton*.
%
%      H = SYL201400800391 returns the handle to a new SYL201400800391 or the handle to
%      the existing singleton*.
%
%      SYL201400800391('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYL201400800391.M with the given input arguments.
%
%      SYL201400800391('Property','Value',...) creates a new SYL201400800391 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before syl201400800391_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to syl201400800391_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help syl201400800391

% Last Modified by GUIDE v2.5 23-Dec-2016 16:48:01

% Begin initialization code - DO NOT EDIT
%x是需要滤波的图像,n是模板大小(即n×n)  

%未被赋值的元素取原值  
 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @syl201400800391_OpeningFcn, ...
                   'gui_OutputFcn',  @syl201400800391_OutputFcn, ...
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


% --- Executes just before syl201400800391 is made visible.
function syl201400800391_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to syl201400800391 (see VARARGIN)

% Choose default command line output for syl201400800391
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes syl201400800391 wait for user response (see UIRESUME)
% uiwait(handles.figure_pjimage);
setappdata(handles.figure_pjimage,'im',0); 
axes(handles.axes1);
axis('off');
axes(handles.axes2);
axis('off');
% --- Outputs from this function are returned to the command line.
function varargout = syl201400800391_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in RGB2Gray.
function RGB2Gray_Callback(hObject, eventdata, handles)
% hObject    handle to RGB2Gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imnew = getappdata(gcf,'im');

axes(handles.axes2);
imshow(rgb2gray(imnew));



% --------------------------------------------------------------------
function M_FIlE_Callback(hObject, eventdata, handles)
% hObject    handle to M_FIlE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function M_FILE_SAVE_Callback(hObject, eventdata, handles)
% hObject    handle to M_FILE_SAVE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.jpg;','JPGfiles'}, 'Pick an Image');  
if isequal(filename,0) || isequal(pathname,0)  
return;
else  
fpath=fullfile(pathname, filename);
end  
img_src=getappdata(handles.figure_pjimage,'im');
imwrite(img_src,fpath); 






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

%setappdata(gcf,'im',im);
setappdata(handles.figure_pjimage,'im',im);  

% --- Executes on button press in InverImage.
function InverImage_Callback(hObject, eventdata, handles)
% hObject    handle to InverImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
imgInverse=getappdata(gcf,'im');

axes(handles.axes2);
j=double(rgb2gray(imgInverse));
j=255-j;
j=uint8(j);
imshow(j);



% --- Executes on button press in LogChange.
function LogChange_Callback(hObject, eventdata, handles)
% hObject    handle to LogChange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
imgInverse=getappdata(gcf,'im');

axes(handles.axes2);
j=double(rgb2gray(imgInverse));

v = 10;
g_1 = log2(1 + v*j)/log2(v+1);


imshow(g_1,[]);


% --- Executes on button press in gmbt.
function gmbt_Callback(hObject, eventdata, handles)
% hObject    handle to gmbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
imgInverse=getappdata(gcf,'im');
axes(handles.axes2);
j=double(rgb2gray(imgInverse));
C = 1;
Gamma = str2double(get(handles.txt_display,'string'));
g2 = C*(j.^Gamma);

imshow(g2,[]);


% --- Executes on slider movement.
function slider_val_Callback(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.txt_display,'String',num2str(val));  

% --- Executes during object creation, after setting all properties.
function slider_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnshowzft.
function btnshowzft_Callback(hObject, eventdata, handles)
% hObject    handle to btnshowzft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I_gray = rgb2gray(I);   
figure    
subplot(221)    
imshow(I_gray)    
subplot(222)    
imhist(I_gray)

% --- Executes on button press in btnzft.
function btnzft_Callback(hObject, eventdata, handles)
% hObject    handle to btnzft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(gcf,'im');     
I_gray = rgb2gray(I);  

  
[height,width]=size(I_gray); 
p=zeros(1,256);                        
for i=1:height  
    for j=1:width  
     p(I_gray(i,j) + 1) = p(I_gray(i,j) + 1)  + 1;  
    end  
end  
s=zeros(1,256);  
s(1)=p(1);  
for i=2:256  
     s(i)=p(i) + s(i-1); 
end  
  
for i=1:256  
    s(i) = s(i)*256/(width*height); 
    if s(i) > 256  
        s(i) = 256;  
    end  
end  
  
%图像均衡化  
I_equal = I;  
for i=1:height  
    for j=1:width  
     I_equal(i,j) = s( I(i,j) + 1);  
    end  
end  
axes(handles.axes2);
imshow(I_equal,[]);


% --- Executes on button press in btnhdavg.
function btnhdavg_Callback(hObject, eventdata, handles)
% hObject    handle to btnhdavg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%直方图均衡化    
 I = getappdata(gcf,'im');   
I= rgb2gray(I);
[height,width] = size(I);  
%进行像素灰度统计;    
s = zeros(1,256);%统计各灰度数目，共256个灰度级    
for i = 1:height    
    for j = 1: width    
        s(I(i,j) + 1) = s(I(i,j) + 1) + 1;%对应灰度值像素点数量增加一    
    end    
end    
%计算灰度分布密度    
p = zeros(1,256);    
for i = 1:256    [height,width] = size(I);  
    p(i) = s(i) / (height * width * 1.0);    
end    
%计算累计直方图分布    
c = zeros(1,256);    
c(1) = p(1);  
for i = 2:256     
        c(i) = c(i - 1) + p(i);    
end    
%累计分布取整,将其数值归一化为1~256   
c = uint8(255 .* c + 0.5);    
%对图像进行均衡化  
for i = 1:height    
    for j = 1: width    
        I(i,j) = c(I(i,j)+1);    
    end    
end    
axes(handles.axes2);
imshow(I)%显示均衡化后的图像  

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[height,width] = size(I);  
%进行像素灰度统计;    
s = zeros(1,256);%统计各灰度数目，共256个灰度级    
for i = 1:height    
    for j = 1: width    
        s(I(i,j) + 1) = s(I(i,j) + 1) + 1;%对应灰度值像素点数量增加一    
    end    
end    
%计算灰度分布密度    
p = zeros(1,256);    
for i = 1:256    [height,width] = size(I);  
    p(i) = s(i) / (height * width * 1.0);    
end    
%计算累计直方图分布    
c = zeros(1,256);    
c(1) = p(1);  
for i = 2:256     
        c(i) = c(i - 1) + p(i);    
end    
%累计分布取整,将其数值归一化为1~256   
c = uint8(255 .* c + 0.5);    
%对图像进行均衡化  
for i = 1:height    
    for j = 1: width    
        I(i,j) = c(I(i,j)+1);    
    end    
end    
figure    
subplot(221)    
imshow(I)%显示原始图像    
subplot(222)    
imhist(I)%显示均衡化后的图像  

function d=avgfilt(x,n)     
a(1:n,1:n)=1;   %a即n×n模板,元素全是1  
[height, width]=size(x);   %输入图像是hightxwidth的,且hight>n,width>n  
x1=double(x);  
x2=x1;  
for i=1:height-n+1  
    for j=1:width-n+1  
        c=x1(i:i+(n-1),j:j+(n-1)).*a; %取出x1中从(i,j)开始的n行n列元素与模板相乘  
        s=sum(sum(c));                 %求c矩阵中各元素之和  
        x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n); %将与模板运算后的各元素的均值赋给模板中心位置的元素  
    end  
end  
d=uint8(x2); 
% --- Executes on button press in btnSmoothLF.
function btnSmoothLF_Callback(hObject, eventdata, handles)
% hObject    handle to btnSmoothLF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x是需要滤波的图像,n是模板大小(即n×n)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=avgfilt(g,3);     %调用自编函数进行均值滤波，n为模板大小   
axes(handles.axes2);
imshow(Y2,[]);

% --- Executes on button press in btnenhancement.
function btnenhancement_Callback(hObject, eventdata, handles)
% hObject    handle to btnenhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[M,N]=size(I);   % 计算图像的尺寸
f=double(I);     % 数据类型转换，MATLAB不支持图像的无符号整型的计算
g=fft2(f);       % 二维傅立叶变换，得到频域信息
g=fftshift(g);   % 0频率移到(M/2,N/2)处

n=2;            % 二阶巴特沃斯(Butterworth)滤波器
D0=3;           % 巴特沃斯滤波器的D0，D0越大，保留的高频信号就越少（对于不同的图片，可以自行调节，以便得到好的效果）
for i=1:M
    for j=1:N 
        D=sqrt((i-M/2)^2+(j-N/2)^2);   %计算离0频率(M/2,N/2)的距离
        h=1/(1+(D0/D)^(2*n));          %计算传递函数的值
        output(i,j)=h*g(i,j);          %高通滤波之后(i,j)处的值
    end
end
result=ifftshift(output);   %与g=fftshift(g)对应，还原回去
I=ifft2(result);   %傅里叶反变换
I=uint8(real(I));  %得到滤波之后的图像（锐化之后的图像）
axes(handles.axes2);
imshow(I,[])          %滤波后图像显示


% --- Executes on button press in btnshowgs.
function btnshowgs_Callback(hObject, eventdata, handles)
% hObject    handle to btnshowgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
x= rgb2gray(x);
gaus = str2double(get(handles.text10,'string'));
g=imnoise(x,'gaussian',0.1,gaus); %加入高斯噪声  
figure,imshow(g),title('加入高斯噪声之后的图象'); %显示加入高斯噪声之后的图象  


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
salt = str2double(get(handles.text9,'string'));
I=imnoise(I,'salt & pepper',salt); % 叠加密度为0.04的椒盐噪声
figure
imshow(I)
title('原图')


% --------------------------------------------------------------------
function Chapter_3_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Chapter_2_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
chapter2

% --- Executes on button press in btnsmaller.
function btnsmaller_Callback(hObject, eventdata, handles)
% hObject    handle to btnsmaller (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[M,N]=size(I);
a=str2double(get(handles.text7,'string'));
times=a;
J1=zeros(floor(M*times),floor(N*times));
J=im2uint8(J1);
for i=1:floor(M*times)
    for j=1:floor(N*times)
        x = floor(i/times);
        y = floor(j/times);
        if(x<M&&y<N)
            J(i,j)=I(x,y);
        end
    end
end
axes(handles.axes2);
imshow(J);
title('图像缩放');


% --- Executes on button press in btnrotate.
function btnrotate_Callback(hObject, eventdata, handles)
% hObject    handle to btnrotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[M,N]=size(I);
ang=str2double(get(handles.text8,'string'));
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
title('图像旋转');

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
% --- Executes on button press in btncopy.
function btncopy_Callback(hObject, eventdata, handles)
% hObject    handle to btncopy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
axes(handles.axes2);
subplot(2,2,1);
imshow(I);
title('原图像');
J1=mirror(I,1);
J2=mirror(I,2);
J3=mirror(I,3);
subplot(2,2,2);
imshow(J1);
title('水平镜像');
subplot(2,2,3);
imshow(J2);
title('垂直镜像');
subplot(2,2,4);
imshow(J3);
title('水平镜像的垂直镜像');




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
% --- Executes on button press in btnmove.
function btnmove_Callback(hObject, eventdata, handles)
% hObject    handle to btnmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
a=str2double(get(handles.editX,'String'));
b=str2double(get(handles.editY,'String'));
J=move(I,a,b);
axes(handles.axes2);
imshow(J,[]);


% --- Executes during object creation, after setting all properties.
function panel8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panel8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


% --- Executes on button press in radiobutton1.


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text7,'String',num2str(val));  

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text8,'String',num2str(val));  


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text9,'String',num2str(val));  

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');  
set(handles.text10,'String',num2str(val));  


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,5,ones(3,3));     %调用自编函数进行均值滤波，n为模板大小   
axes(handles.axes2);
imshow(Y2,[]);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)%最大值滤波器
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,9,ones(3,3));      
axes(handles.axes2);
imshow(Y2,[]);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=ordfilt2(g,1,ones(3,3));     %调用自编函数进行均值滤波，n为模板大小   
axes(handles.axes2);
imshow(Y2,[]);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)%自适应中值滤波的算法
% hObject    handle to pushbutton22 (see GCBO)
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





% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Chapter_4_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
chapter4


% --------------------------------------------------------------------
function Chapter_5_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
chapter5


% --------------------------------------------------------------------
function Chapter_6_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
chapter6
