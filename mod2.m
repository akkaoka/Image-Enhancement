function varargout = mod2(varargin)
% MOD2 MATLAB code for mod2.fig
%      MOD2, by itself, creates a new MOD2 or raises the existing
%      singleton*.
%
%      H = MOD2 returns the handle to a new MOD2 or the handle to
%      the existing singleton*.
%
%      MOD2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOD2.M with the given input arguments.
%
%      MOD2('Property','Value',...) creates a new MOD2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mod2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mod2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mod2

% Last Modified by GUIDE v2.5 06-Apr-2018 12:37:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mod2_OpeningFcn, ...
                   'gui_OutputFcn',  @mod2_OutputFcn, ...
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


% --- Executes just before mod2 is made visible.
function mod2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mod2 (see VARARGIN)

% Choose default command line output for mod2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mod2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mod2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open_btn.
function open_btn_Callback(hObject, eventdata, handles)
% hObject    handle to open_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
[name_file1,name_path1] = uigetfile( ...
{'*.bmp;*.jpg;','Files of type (*.bmp,*.jpg)';},...
'Open Image');
    if ~isequal(name_file1,0)
        data = imread(fullfile(name_path1,name_file1));
        guidata(hObject,handles);
        axes(handles.ib1);
        imshow(data);
    else
        return;
    end

% --- Executes on button press in grayscale_btn.
function grayscale_btn_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data
global gray
tic;
gray = rgb2gray(data);
axes(handles.ib2);
imshow(gray)
toc;
disp(toc)

% --- Executes on button press in biner_btn.
function biner_btn_Callback(hObject, eventdata, handles)
% hObject    handle to biner_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray 
tic;
level = graythresh(gray);       
bw = imbinarize(gray, level);
axes(handles.ib3);
imshow(bw)
toc;
disp(toc)

% --- Executes on button press in lpf3.
function lpf3_Callback(hObject, eventdata, handles)
% hObject    handle to lpf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel = ones(3,3)/9;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in lpf5.
function lpf5_Callback(hObject, eventdata, handles)
% hObject    handle to lpf5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel = ones(5,5)/25;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in lpf7.
function lpf7_Callback(hObject, eventdata, handles)
% hObject    handle to lpf7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel = ones(7,7)/49;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in lpf9.
function lpf9_Callback(hObject, eventdata, handles)
% hObject    handle to lpf9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel = ones(9,9)/81;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in hpf3.
function hpf3_Callback(hObject, eventdata, handles)
% hObject    handle to hpf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel= -1 * ones(3,3);
kernel(2,2) = 8;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in hpf5.
function hpf5_Callback(hObject, eventdata, handles)
% hObject    handle to hpf5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel= -1 * ones(5,5);
kernel(3,3) = 24;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in hpf7.
function hpf7_Callback(hObject, eventdata, handles)
% hObject    handle to hpf7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel= -1 * ones(7,7);
kernel(4,4) = 48;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in hpf9.
function hpf9_Callback(hObject, eventdata, handles)
% hObject    handle to hpf9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);
imgd = imnoise(pic,'salt & pepper');
kernel= -1 * ones(9,9);
kernel(5,5) = 80;
img1 = imfilter(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in mf3.
function mf3_Callback(hObject, eventdata, handles)
% hObject    handle to mf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);   % imgd in [0,1]
imgd = imnoise(pic,'salt & pepper');
kernel = [3 3];
img1 = medfilt2(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in mf5.
function mf5_Callback(hObject, eventdata, handles)
% hObject    handle to mf5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);   % imgd in [0,1]
imgd = imnoise(pic,'salt & pepper');
kernel = [5 5];
img1 = medfilt2(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in mf7.
function mf7_Callback(hObject, eventdata, handles)
% hObject    handle to mf7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);   % imgd in [0,1]
imgd = imnoise(pic,'salt & pepper');
kernel = [7 7];
img1 = medfilt2(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in mf9.
function mf9_Callback(hObject, eventdata, handles)
% hObject    handle to mf9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gray
tic;
pic = im2double(gray);   % imgd in [0,1]
imgd = imnoise(pic,'salt & pepper');
kernel = [9 9];
img1 = medfilt2(imgd, kernel);
axes(handles.ib3);
imshow(imgd);
axes(handles.ib4);
imshow(img1);
toc;
disp(toc)

% --- Executes on button press in exit_btn.
function exit_btn_Callback(hObject, eventdata, handles)
% hObject    handle to exit_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close()
