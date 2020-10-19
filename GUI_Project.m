function varargout = GUI_Project(varargin)
% GUI_PROJECT MATLAB code for GUI_Project.fig
%      GUI_PROJECT, by itself, creates a new GUI_PROJECT or raises the existing
%      singleton*.
%
%      H = GUI_PROJECT returns the handle to a new GUI_PROJECT or the handle to
%      the existing singleton*.
%
%      GUI_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PROJECT.M with the given input arguments.
%
%      GUI_PROJECT('Property','Value',...) creates a new GUI_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Project

% Last Modified by GUIDE v2.5 04-Jan-2020 12:41:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Project_OutputFcn, ...
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


% --- Executes just before GUI_Project is made visible.
function GUI_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Project (see VARARGIN)

% Choose default command line output for GUI_Project
handles.output = hObject;






l = [10 10 10 5];
h = 2;
M = [0 -1 0 0;0 0 -1 0;1 0 0 h+sum(l) ;0 0 0 1;];
B = [1 0 0 1 0 0;0 0 0 0 0 0 ;0 1 1 0 1 1; 0 0 0 0 0 0;0 sum(l) sum(l(1,2:4)) 0 l(4) 0;0 0 0 0 0 0];



theta = [0 0 0 0 0 ];


handles.l = l;
handles.h = h;
handles.M = M;
handles.B = B;
handles.init_theta = [0 0 0 0 0];
set(handles.T_mat1,'Data',(PoE_body(M,B,theta)));

set(handles.T_mat2,'Data',(PoE_body(M,B,theta)));
set(handles.T_mat3,'Data',(PoE_body(M,B,theta)));
%mat2str(PoE_body(M,B,theta))
L(1) = Link('revolute', 'd', h, 'a', 0, 'alpha', pi/2);
L(2) = Link('revolute', 'd', 0, 'a', l(1), 'alpha', 0);
L(3) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2);
L(4) = Link('revolute', 'd',  l(2)+l(3), 'a',0, 'alpha', pi/2);
L(5) = Link('revolute', 'd',  0, 'a',l(4), 'alpha', 0);
handles.theta = theta;
robot = SerialLink(L);
robot.name = 'Rio';
set(handles.angle1,'String',theta(1));
set(handles.angle2,'String',theta(2));
set(handles.angle3,'String',theta(3));
set(handles.angle4,'String',theta(4));
set(handles.angle5,'String',theta(5));


set(handles.theta1,'String',theta(1));
set(handles.theta2,'String',theta(2));
set(handles.theta3,'String',theta(3));
set(handles.theta4,'String',theta(4));
set(handles.theta5,'String',theta(5));


set(handles.sld_ang1,'String',num2str(0.00));
set(handles.sld_ang2,'String',num2str(0.00));
set(handles.sld_ang3,'String',num2str(0.00));
set(handles.sld_ang4,'String',num2str(0.00));
set(handles.sld_ang5,'String',num2str(0.00));

addition = [0 pi/2 -pi/2 0 pi/2];
final_theta = theta + addition;
axes(handles.box);
robot.plot(final_theta);
handles.robo = robot;


handles.addition = addition;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function angle1_Callback(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle1 as text
%        str2double(get(hObject,'String')) returns contents of angle1 as a double


% --- Executes during object creation, after setting all properties.
function angle1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle2_Callback(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle2 as text
%        str2double(get(hObject,'String')) returns contents of angle2 as a double


% --- Executes during object creation, after setting all properties.
function angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle3_Callback(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle3 as text
%        str2double(get(hObject,'String')) returns contents of angle3 as a double


% --- Executes during object creation, after setting all properties.
function angle3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle4_Callback(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle4 as text
%        str2double(get(hObject,'String')) returns contents of angle4 as a double


% --- Executes during object creation, after setting all properties.
function angle4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle5_Callback(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angle5 as text
%        str2double(get(hObject,'String')) returns contents of angle5 as a double


% --- Executes during object creation, after setting all properties.
function angle5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fk_button.
function fk_button_Callback(hObject, eventdata, handles)
% hObject    handle to fk_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = get(handles.select_fk,'Value');
if x == get(handles.select_fk,'Max') 
angles = zeros(1,5);
angles(1) = str2num(get(handles.angle1,'String'));
angles(2) = str2num(get(handles.angle2,'String'));
angles(3) = str2num(get(handles.angle3,'String'));
angles(4) = str2num(get(handles.angle4,'String'));
angles(5) = str2num(get(handles.angle5,'String'));

angles = (pi/180)*angles;
handles.theta = angles;
set(handles.T_mat1,'Data',round(PoE_body(handles.M,handles.B,handles.theta),3));
axes(handles.box);
robot = handles.robo;
robot.plot(handles.theta+handles.addition);

end

% --- Executes on button press in home1.
function home1_Callback(hObject, eventdata, handles)
% hObject    handle to home1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = get(handles.select_fk,'Value');
if x == get(handles.select_fk,'Max') 
handles.theta = [0 0 0 0 0];
guidata(hObject,handles);
theta = handles.theta;

set(handles.angle1,'String',theta(1));
set(handles.angle2,'String',theta(2));
set(handles.angle3,'String',theta(3));
set(handles.angle4,'String',theta(4));
set(handles.angle5,'String',theta(5));
set(handles.T_mat1,'Data',round(PoE_body(handles.M,handles.B,theta),3));
axes(handles.box);
robot = handles.robo;
robot.plot(theta+handles.addition);

end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
   
    set(handles.sld_ang1,'String',num2str(get(handles.slider1,'Value')));
    
    
    
    
    angles = zeros(1,5);
    angles(1) = get(handles.slider1,'Value')*(pi/180);
    angles(2) = get(handles.slider2,'Value')*(pi/180);
    angles(3) = get(handles.slider3,'Value')*(pi/180);
    angles(4) = get(handles.slider4,'Value')*(pi/180);
    angles(5) = get(handles.slider5,'Value')*(pi/180); 
    
    set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,angles),3));
    robot = handles.robo;
    axes(handles.box);
    robot.plot(angles+handles.addition);
end

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
x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
    
    set(handles.sld_ang2,'String',num2str(get(handles.slider2,'Value')));
    angles = zeros(1,5);
    angles(1) = get(handles.slider1,'Value')*(pi/180);
    angles(2) = get(handles.slider2,'Value')*(pi/180);
    angles(3) = get(handles.slider3,'Value')*(pi/180);
    angles(4) = get(handles.slider4,'Value')*(pi/180);
    angles(5) = get(handles.slider5,'Value')*(pi/180); 
    
    set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,angles),3));
    robot = handles.robo;
    axes(handles.box);
    robot.plot(angles+handles.addition);
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)

x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
   
    set(handles.sld_ang3,'String',num2str(get(handles.slider3,'Value')));
    angles = zeros(1,5);
    angles(1) = get(handles.slider1,'Value')*(pi/180);
    angles(2) = get(handles.slider2,'Value')*(pi/180);
    angles(3) = get(handles.slider3,'Value')*(pi/180);
    angles(4) = get(handles.slider4,'Value')*(pi/180);
    angles(5) = get(handles.slider5,'Value')*(pi/180); 
    
    set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,angles),3));
    robot = handles.robo;
    axes(handles.box);
    robot.plot(angles+handles.addition);
end
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
   
    set(handles.sld_ang4,'String',num2str(get(handles.slider4,'Value')));
    angles = zeros(1,5);
    angles(1) = get(handles.slider1,'Value')*(pi/180);
    angles(2) = get(handles.slider2,'Value')*(pi/180);
    angles(3) = get(handles.slider3,'Value')*(pi/180);
    angles(4) = get(handles.slider4,'Value')*(pi/180);
    angles(5) = get(handles.slider5,'Value')*(pi/180); 
    
    set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,angles),3));
    robot = handles.robo;
    axes(handles.box);
    robot.plot(angles+handles.addition);
end
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)

x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
    
    set(handles.sld_ang5,'String',num2str(get(handles.slider5,'Value')));
    angles = zeros(1,5);
    angles(1) = get(handles.slider1,'Value')*(pi/180);
    angles(2) = get(handles.slider2,'Value')*(pi/180);
    angles(3) = get(handles.slider3,'Value')*(pi/180);
    angles(4) = get(handles.slider4,'Value')*(pi/180);
    angles(5) = get(handles.slider5,'Value')*(pi/180); 
    
    set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,angles),3));
    robot = handles.robo;
    axes(handles.box);
    robot.plot(angles+handles.addition);
end
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in fk_button2.
function fk_button2_Callback(hObject, eventdata, handles)
% hObject    handle to fk_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in home2.
function home2_Callback(hObject, eventdata, handles)
% hObject    handle to home2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = get(handles.fk_slider_button,'Value');
if x == get(handles.fk_slider_button,'Max') 
handles.theta = [0 0 0 0 0];
guidata(hObject,handles);
theta = handles.theta;


set(handles.sld_ang1,'String',num2str(0.00));
set(handles.sld_ang2,'String',num2str(0.00));
set(handles.sld_ang3,'String',num2str(0.00));
set(handles.sld_ang4,'String',num2str(0.00));
set(handles.sld_ang5,'String',num2str(0.00));

set(handles.slider1,'Value',theta(1));
set(handles.slider2,'Value',theta(2));
set(handles.slider3,'Value',theta(3));
set(handles.slider4,'Value',theta(4));
set(handles.slider5,'Value',theta(5));
set(handles.T_mat2,'Data',round(PoE_body(handles.M,handles.B,theta),3));
axes(handles.box);
robot = handles.robo;
robot.plot(theta+handles.addition);

end

% --- Executes on button press in fk_slider_button.
function fk_slider_button_Callback(hObject, eventdata, handles)
% hObject    handle to fk_slider_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fk_slider_button


% --- Executes on button press in inv_kinematics_button.
function inv_kinematics_button_Callback(hObject, eventdata, handles)
% hObject    handle to inv_kinematics_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of inv_kinematics_button



function T_mat1_Callback(hObject, eventdata, handles)
% hObject    handle to T_mat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T_mat1 as text
%        str2double(get(hObject,'String')) returns contents of T_mat1 as a double


% --- Executes during object creation, after setting all properties.
function T_mat1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T_mat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_solution.
function show_solution_Callback(hObject, eventdata, handles)
% hObject    handle to show_solution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.inv_kinematics_button,'Value') == 1
    
Td = get(handles.T_mat3,'Data');
init_theta = [0 0 0 0 0];
Td

valid = 0;
theta_guess = [ 0 0 0 0 0;pi/2 pi/2 pi/2 pi/2 pi/2;pi pi pi pi pi ;-pi/2 -pi/2 -pi/2 -pi/2 -pi/2; -pi -pi -pi -pi -pi;];


for x = 1:size(theta_guess,1)
st_guess = theta_guess(x,:)
[S,thetas] = Inv_kinematics(handles.B,theta_guess(x,:),0.1,0.5,handles.M,Td,700);
thetas = rem(thetas,2*pi);
if (S ==1 )
    
    angles = (180/pi)*thetas';
    
    
    for s = 1:length(angles)
        
        if angles(s) > 180
            angles(s) = - (360-(angles(s)));
        end
        if angles(s) < -180
            sub = -180 - angles(s);
            angles(s) = 180 - sub;
        end
    end
    answers = angles
    if (valid_solution(angles) == 1)
        valid = 1;
        break;
    end
    
    
end


    
end

if (valid == 1)
    set(handles.status,'String','Solution found! :)');
    set(handles.theta1,'String',round(angles(1),3));
    set(handles.theta2,'String',round(angles(2),3));
    set(handles.theta3,'String',round(angles(3),3));
    set(handles.theta4,'String',round(angles(4),3));
    set(handles.theta5,'String',round(angles(5),3));
    
    robot = handles.robo;
    axes(handles.box);
    robot.plot(thetas'+handles.addition);
    
    PoE_body(handles.M,handles.B,thetas')
else
    set(handles.status,'String','Sorry, I tried my best! :(');
    disp('Sorry, I tried my best :( ');  

end
end



function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of status as text
%        str2double(get(hObject,'String')) returns contents of status as a double


% --- Executes during object creation, after setting all properties.
function status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta1_Callback(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1 as text
%        str2double(get(hObject,'String')) returns contents of theta1 as a double


% --- Executes during object creation, after setting all properties.
function theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_Callback(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2 as text
%        str2double(get(hObject,'String')) returns contents of theta2 as a double


% --- Executes during object creation, after setting all properties.
function theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta3_Callback(hObject, eventdata, handles)
% hObject    handle to theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta3 as text
%        str2double(get(hObject,'String')) returns contents of theta3 as a double


% --- Executes during object creation, after setting all properties.
function theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_Callback(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta4 as text
%        str2double(get(hObject,'String')) returns contents of theta4 as a double


% --- Executes during object creation, after setting all properties.
function theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta5_Callback(hObject, eventdata, handles)
% hObject    handle to theta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta5 as text
%        str2double(get(hObject,'String')) returns contents of theta5 as a double


% --- Executes during object creation, after setting all properties.
function theta5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)


if get(handles.inv_kinematics_button,'Value') == 1
    






Td = get(handles.T_mat3,'Data');

Td

valid = 0;
theta_guess = [ handles.init_theta;0 0 0 0 0;pi/2 pi/2 pi/2 pi/2 pi/2;pi pi pi pi pi ;-pi/2 -pi/2 -pi/2 -pi/2 -pi/2; -pi -pi -pi -pi -pi;];


for x = 1:size(theta_guess,1)
st_guess = theta_guess(x,:)
[S,thetas] = Inv_kinematics(handles.B,theta_guess(x,:),0.1,1,handles.M,Td,700);
thetas = rem(thetas,2*pi);
if (S ==1 )
    
    angles = (180/pi)*thetas';
    
    
    for s = 1:length(angles)
        
        if angles(s) > 180
            angles(s) = - (360-(angles(s)));
        end
        if angles(s) < -180
            sub = -180 - angles(s);
            angles(s) = 180 - sub;
        end
    end
    
    if (valid_solution(angles) == 1)
        valid = 1;
        break;
    end
    
    
end


    
end

if (valid == 1)
    set(handles.status,'String','Solution found! :)');
    set(handles.theta1,'String',round(angles(1),3));
    set(handles.theta2,'String',round(angles(2),3));
    set(handles.theta3,'String',round(angles(3),3));
    set(handles.theta4,'String',round(angles(4),3));
    set(handles.theta5,'String',round(angles(5),3));
    
    
    
    final =round(angles,3);
    
    init_theta = [0 0 0 0 0];
    %init_theta = handles.init_theta;
    
    while(~equal(init_theta,final))
       
       for i = 1:length(init_theta)
           
           if (abs(final(i) - init_theta(i)) >15)
           if final(i) > init_theta(i)
               init_theta(i) = init_theta(i) + 13;
           end
           if final(i) < init_theta(i)
               init_theta(i) = init_theta(i) - 13;
           end
           end
         
           if (abs(final(i) - init_theta(i)) >5 ) && (abs(final(i) - init_theta(i)) <15)
           if final(i) > init_theta(i)
               init_theta(i) = init_theta(i) + 4;
           end
           if final(i) < init_theta(i)
               init_theta(i) = init_theta(i) - 4;
           end
           end
           
           if (abs(final(i) - init_theta(i)) >2) && (abs(final(i) - init_theta(i)) <5)
           if final(i) > init_theta(i)
               init_theta(i) = init_theta(i) + 1.5;
           end
           if final(i) < init_theta(i)
               init_theta(i) = init_theta(i) - 1.5;
           end
           end
           
           if (abs(final(i) - init_theta(i)) >0.5) && (abs(final(i) - init_theta(i)) <2)
           if final(i) > init_theta(i)
               init_theta(i) = init_theta(i) + 0.4;
           end
           if final(i) < init_theta(i)
               init_theta(i) = init_theta(i) - 0.4;
           end
           end
           
               
       end
       
       robot = handles.robo;
       axes(handles.box);
       
       
       robot.plot((pi/180)*init_theta+handles.addition);
       %pause(0.003);
        
    end
    
    %handles.init_theta = solution;
    %guidata(hObject, handles);
    
   
    
    
    
else
    set(handles.status,'String','Sorry, I tried my best! :(');
    disp('Sorry, I tried my best :( ');  

end























if (S ==1 )
    
    angles = (180/pi)*thetas';
    angles
    for s = 1:length(angles)
        
        if angles(s) > 180
            angles(s) = - (360-(angles(s)));
        end
    end
    angles
    set(handles.status,'String','Solution found! :)');
    set(handles.theta1,'String',round(angles(1),3));
    set(handles.theta2,'String',round(angles(2),3));
    set(handles.theta3,'String',round(angles(3),3));
    set(handles.theta4,'String',round(angles(4),3));
    set(handles.theta5,'String',round(angles(5),3));
    
    init_theta = [0 0 0 0 0];
    
    final = angles
    %robot = handles.robo;
    %axes(handles.box);
    %robot.plot(thetas'+handles.addition);
    
    final
    init_theta

    
else
    set(handles.status,'String','Sorry, I tried my best! :(');
    disp('Sorry, I tried my best :( ');
end
end


% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
