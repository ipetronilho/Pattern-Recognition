function varargout = RP_GUI(varargin)
% RP_GUI MATLAB code for RP_GUI.fig
%      RP_GUI, by itself, creates a new RP_GUI or raises the existing
%      singleton*.
%
%      H = RP_GUI returns the handle to a new RP_GUI or the handle to
%      the existing singleton*.
%
%      RP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RP_GUI.M with the given input arguments.
%
%      RP_GUI('Property','Value',...) creates a new RP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RP_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RP_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RP_GUI

% Last Modified by GUIDE v2.5 28-May-2016 16:55:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RP_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RP_GUI_OutputFcn, ...
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


% --- Executes just before RP_GUI is made visible.
function RP_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RP_GUI (see VARARGIN)

% Choose default command line output for RP_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RP_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RP_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dataset_directory_Callback(hObject, eventdata, handles)
% hObject    handle to dataset_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dataset_directory as text
%        str2double(get(hObject,'String')) returns contents of dataset_directory as a double


% --- Executes during object creation, after setting all properties.
function dataset_directory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataset_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse_files_dataset_directory.
function browse_files_dataset_directory_Callback(hObject, eventdata, handles)
% hObject    handle to browse_files_dataset_directory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    uigetfile();


% --- Executes on button press in checkbox_pca.
function checkbox_pca_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_pca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_pca
state = get(hObject, 'Value');
if state
    state = 'on';
else
    state = 'off';
end
set(findall(handles.buttongroup_pca, '-property', 'enable'), 'enable', state);

% --- Executes on button press in checkbox_lda.
function checkbox_lda_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_lda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_lda


% --- Executes on button press in radiobutton_pca_kaiser.
function radiobutton_pca_kaiser_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_pca_kaiser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_pca_kaiser


% --- Executes on button press in radiobutton_pca_scree.
function radiobutton_pca_scree_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_pca_scree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_pca_scree


% --- Executes on button press in checkbox_feature_selection.
function checkbox_feature_selection_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_feature_selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_feature_selection



function textfield_covariance_treshold_Callback(hObject, eventdata, handles)
% hObject    handle to textfield_covariance_treshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textfield_covariance_treshold as text
%        str2double(get(hObject,'String')) returns contents of textfield_covariance_treshold as a double


% --- Executes during object creation, after setting all properties.
function textfield_covariance_treshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfield_covariance_treshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_normalize.
function checkbox_normalize_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_normalize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of checkbox_normalize



function textfield_splitting_percentage_Callback(hObject, eventdata, handles)
% hObject    handle to textfield_splitting_percentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textfield_splitting_percentage as text
%        str2double(get(hObject,'String')) returns contents of textfield_splitting_percentage as a double


% --- Executes during object creation, after setting all properties.
function textfield_splitting_percentage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfield_splitting_percentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_classifiers_1.
function popupmenu_classifiers_1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_classifiers_1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_classifiers_1


% --- Executes during object creation, after setting all properties.
function popupmenu_classifiers_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_classifiers_2.
function popupmenu_classifiers_2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_classifiers_2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_classifiers_2


% --- Executes during object creation, after setting all properties.
function popupmenu_classifiers_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_classifiers_3.
function popupmenu_classifiers_3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_classifiers_3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_classifiers_3


% --- Executes during object creation, after setting all properties.
function popupmenu_classifiers_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_classifiers_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_voter.
function checkbox_voter_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_voter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_voter
state = get(hObject, 'Value');
if state
    state = 'on';
else
    state = 'off';
end
set(handles.popupmenu_classifiers_2, 'enable', state);
set(handles.popupmenu_classifiers_3, 'enable', state);


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % ~~ pre-processing ~~ 
    global PATH_DATASET
    PATH_DATASET = get(handles.dataset_directory, 'String');
    
    global NORMALIZE_FLAG
    NORMALIZE_FLAG  = get(handles.checkbox_normalize, 'Value');
    NORMALIZE_FLAG
    
    % ~~ Feature Selection ~~
    global FEATURE_SELECTION
    FEATURE_SELECTION  = get(handles.checkbox_feature_selection, 'Value');
    
    global COVARIANCE_TRESHOLD
    COVARIANCE_TRESHOLD  = str2double(get(handles.textfield_covariance_treshold, 'String'));
    
    
    % ~~ Feature Reduction ~~ 
    global PCA_FLAG
    global PCA_FLAG_KAISER
    global PCA_FLAG_SCREE
    
    PCA_FLAG = get(handles.checkbox_pca, 'Value');
    PCA_FLAG_KAISER = get(handles.radiobutton_pca_kaiser, 'Value');
    PCA_FLAG_SCREE= get(handles.radiobutton_pca_scree, 'Value');
    
    
    global LDA_FLAG
    LDA_FLAG = get(handles.checkbox_lda, 'Value');
    
    
    % ~~ Classifier ~~ 
    global SPLITTING_PERCENTAGE
    global VOTER_FLAG
    global CLASSIFIER_1
    global CLASSIFIER_2
    global CLASSIFIER_3
    global N_CLASSIFIERS
    
    
    SPLITTING_PERCENTAGE = str2double(get(handles.textfield_splitting_percentage, 'String'));
    VOTER_FLAG = get(handles.checkbox_voter, 'Value');
    
    
    CLASSIFIER_1 = get(handles.popupmenu_classifiers_1, 'Value');
    if VOTER_FLAG
        N_CLASSIFIERS=3
        CLASSIFIER_2 = get(handles.popupmenu_classifiers_2, 'Value');
        CLASSIFIER_3 = get(handles.popupmenu_classifiers_3, 'Value');
    else
        N_CLASSIFIERS=1
    end
    
run_program
