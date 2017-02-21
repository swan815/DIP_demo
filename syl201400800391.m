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
%x����Ҫ�˲���ͼ��,n��ģ���С(��n��n)  

%δ����ֵ��Ԫ��ȡԭֵ  
 
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
  
%ͼ����⻯  
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
%ֱ��ͼ���⻯    
 I = getappdata(gcf,'im');   
I= rgb2gray(I);
[height,width] = size(I);  
%�������ػҶ�ͳ��;    
s = zeros(1,256);%ͳ�Ƹ��Ҷ���Ŀ����256���Ҷȼ�    
for i = 1:height    
    for j = 1: width    
        s(I(i,j) + 1) = s(I(i,j) + 1) + 1;%��Ӧ�Ҷ�ֵ���ص���������һ    
    end    
end    
%����Ҷȷֲ��ܶ�    
p = zeros(1,256);    
for i = 1:256    [height,width] = size(I);  
    p(i) = s(i) / (height * width * 1.0);    
end    
%�����ۼ�ֱ��ͼ�ֲ�    
c = zeros(1,256);    
c(1) = p(1);  
for i = 2:256     
        c(i) = c(i - 1) + p(i);    
end    
%�ۼƷֲ�ȡ��,������ֵ��һ��Ϊ1~256   
c = uint8(255 .* c + 0.5);    
%��ͼ����о��⻯  
for i = 1:height    
    for j = 1: width    
        I(i,j) = c(I(i,j)+1);    
    end    
end    
axes(handles.axes2);
imshow(I)%��ʾ���⻯���ͼ��  

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[height,width] = size(I);  
%�������ػҶ�ͳ��;    
s = zeros(1,256);%ͳ�Ƹ��Ҷ���Ŀ����256���Ҷȼ�    
for i = 1:height    
    for j = 1: width    
        s(I(i,j) + 1) = s(I(i,j) + 1) + 1;%��Ӧ�Ҷ�ֵ���ص���������һ    
    end    
end    
%����Ҷȷֲ��ܶ�    
p = zeros(1,256);    
for i = 1:256    [height,width] = size(I);  
    p(i) = s(i) / (height * width * 1.0);    
end    
%�����ۼ�ֱ��ͼ�ֲ�    
c = zeros(1,256);    
c(1) = p(1);  
for i = 2:256     
        c(i) = c(i - 1) + p(i);    
end    
%�ۼƷֲ�ȡ��,������ֵ��һ��Ϊ1~256   
c = uint8(255 .* c + 0.5);    
%��ͼ����о��⻯  
for i = 1:height    
    for j = 1: width    
        I(i,j) = c(I(i,j)+1);    
    end    
end    
figure    
subplot(221)    
imshow(I)%��ʾԭʼͼ��    
subplot(222)    
imhist(I)%��ʾ���⻯���ͼ��  

function d=avgfilt(x,n)     
a(1:n,1:n)=1;   %a��n��nģ��,Ԫ��ȫ��1  
[height, width]=size(x);   %����ͼ����hightxwidth��,��hight>n,width>n  
x1=double(x);  
x2=x1;  
for i=1:height-n+1  
    for j=1:width-n+1  
        c=x1(i:i+(n-1),j:j+(n-1)).*a; %ȡ��x1�д�(i,j)��ʼ��n��n��Ԫ����ģ�����  
        s=sum(sum(c));                 %��c�����и�Ԫ��֮��  
        x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n); %����ģ�������ĸ�Ԫ�صľ�ֵ����ģ������λ�õ�Ԫ��  
    end  
end  
d=uint8(x2); 
% --- Executes on button press in btnSmoothLF.
function btnSmoothLF_Callback(hObject, eventdata, handles)
% hObject    handle to btnSmoothLF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x����Ҫ�˲���ͼ��,n��ģ���С(��n��n)
x = getappdata(gcf,'im');   
g= rgb2gray(x);
Y2=avgfilt(g,3);     %�����Աຯ�����о�ֵ�˲���nΪģ���С   
axes(handles.axes2);
imshow(Y2,[]);

% --- Executes on button press in btnenhancement.
function btnenhancement_Callback(hObject, eventdata, handles)
% hObject    handle to btnenhancement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
[M,N]=size(I);   % ����ͼ��ĳߴ�
f=double(I);     % ��������ת����MATLAB��֧��ͼ����޷������͵ļ���
g=fft2(f);       % ��ά����Ҷ�任���õ�Ƶ����Ϣ
g=fftshift(g);   % 0Ƶ���Ƶ�(M/2,N/2)��

n=2;            % ���װ�����˹(Butterworth)�˲���
D0=3;           % ������˹�˲�����D0��D0Խ�󣬱����ĸ�Ƶ�źž�Խ�٣����ڲ�ͬ��ͼƬ���������е��ڣ��Ա�õ��õ�Ч����
for i=1:M
    for j=1:N 
        D=sqrt((i-M/2)^2+(j-N/2)^2);   %������0Ƶ��(M/2,N/2)�ľ���
        h=1/(1+(D0/D)^(2*n));          %���㴫�ݺ�����ֵ
        output(i,j)=h*g(i,j);          %��ͨ�˲�֮��(i,j)����ֵ
    end
end
result=ifftshift(output);   %��g=fftshift(g)��Ӧ����ԭ��ȥ
I=ifft2(result);   %����Ҷ���任
I=uint8(real(I));  %�õ��˲�֮���ͼ����֮���ͼ��
axes(handles.axes2);
imshow(I,[])          %�˲���ͼ����ʾ


% --- Executes on button press in btnshowgs.
function btnshowgs_Callback(hObject, eventdata, handles)
% hObject    handle to btnshowgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = getappdata(gcf,'im');   
x= rgb2gray(x);
gaus = str2double(get(handles.text10,'string'));
g=imnoise(x,'gaussian',0.1,gaus); %�����˹����  
figure,imshow(g),title('�����˹����֮���ͼ��'); %��ʾ�����˹����֮���ͼ��  


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = getappdata(gcf,'im');   
I= rgb2gray(I);
salt = str2double(get(handles.text9,'string'));
I=imnoise(I,'salt & pepper',salt); % �����ܶ�Ϊ0.04�Ľ�������
figure
imshow(I)
title('ԭͼ')


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
title('ͼ������');


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
title('ͼ����ת');

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
title('ԭͼ��');
J1=mirror(I,1);
J2=mirror(I,2);
J3=mirror(I,3);
subplot(2,2,2);
imshow(J1);
title('ˮƽ����');
subplot(2,2,3);
imshow(J2);
title('��ֱ����');
subplot(2,2,4);
imshow(J3);
title('ˮƽ����Ĵ�ֱ����');




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
Y2=ordfilt2(g,5,ones(3,3));     %�����Աຯ�����о�ֵ�˲���nΪģ���С   
axes(handles.axes2);
imshow(Y2,[]);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)%���ֵ�˲���
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
Y2=ordfilt2(g,1,ones(3,3));     %�����Աຯ�����о�ֵ�˲���nΪģ���С   
axes(handles.axes2);
imshow(Y2,[]);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)%����Ӧ��ֵ�˲����㷨
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=getappdata(gcf,'im');
img=rgb2gray(img);
[m n]=size(img);

img=imnoise(img,'salt & pepper',0.1);   %���뽷������
figure;
imshow(img,[]);

Nmax=10;        %ȷ�������˲��뾶

%�����Ǳ߽���չ��ͼ���������Ҹ�����Nmax���ء�
imgn=zeros(m+2*Nmax+1,n+2*Nmax+1);
imgn(Nmax+1:m+Nmax,Nmax+1:n+Nmax)=img;

imgn(1:Nmax,Nmax+1:n+Nmax)=img(1:Nmax,1:n);                 %��չ�ϱ߽�
imgn(1:m+Nmax,n+Nmax+1:n+2*Nmax+1)=imgn(1:m+Nmax,n:n+Nmax);    %��չ�ұ߽�
imgn(m+Nmax+1:m+2*Nmax+1,Nmax+1:n+2*Nmax+1)=imgn(m:m+Nmax,Nmax+1:n+2*Nmax+1);    %��չ�±߽�
imgn(1:m+2*Nmax+1,1:Nmax)=imgn(1:m+2*Nmax+1,Nmax+1:2*Nmax);       %��չ��߽�

re=imgn;
for i=Nmax+1:m+Nmax
    for j=Nmax+1:n+Nmax
        
        r=1;                %��ʼ�˲��뾶
        while r~=Nmax
            W=imgn(i-r:i+r,j-r:j+r);
            W=sort(W);
            Imin=min(W(:));
            Imax=max(W(:));
            Imed=W(uint8((2*r+1)^2/2));
            if Imin<Imed && Imed<Imax       %�����ǰ������ֵ���������㣬��ô���ô˴ε�����
               break;
            else
                r=r+1;              %�������󴰿ڣ������ж�
            end          
        end
        
        if Imin<imgn(i,j) && imgn(i,j)<Imax         %�����ǰ������ز���������ԭֵ���
            re(i,j)=imgn(i,j);
        else                                        %�������������ֵ
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
