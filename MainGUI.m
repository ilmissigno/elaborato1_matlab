function varargout = MainGUI(varargin)
% MAINGUI MATLAB code for MainGUI.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGUI

% Last Modified by GUIDE v2.5 28-Mar-2019 00:34:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI_OutputFcn, ...
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


% --- Executes just before MainGUI is made visible.
function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no ris args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGUI (see VARARGIN)

% Choose default command line ris for MainGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning ris args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line ris from handles structure
varargout{1} = handles.output;



function fun_Callback(hObject, eventdata, handles)
% hObject    handle to fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.funz = get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of fun as text
%        str2double(get(hObject,'String')) returns contents of fun as a double


% --- Executes during object creation, after setting all properties.
function fun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function val_a_Callback(hObject, eventdata, handles)
% hObject    handle to val_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.vala = str2double(get(hObject,'String'));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of val_a as text
%        str2double(get(hObject,'String')) returns contents of val_a as a double


% --- Executes during object creation, after setting all properties.
function val_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function val_b_Callback(hObject, eventdata, handles)
% hObject    handle to val_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.valb = str2double(get(hObject,'String'));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of val_b as text
%        str2double(get(hObject,'String')) returns contents of val_b as a double


% --- Executes during object creation, after setting all properties.
function val_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tol_Callback(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.toll = str2double(get(hObject,'String'));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of tol as text
%        str2double(get(hObject,'String')) returns contents of tol as a double


% --- Executes during object creation, after setting all properties.
function tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nmax_Callback(hObject, eventdata, handles)
% hObject    handle to nmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.nummax = str2double(get(hObject,'String'));
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of nmax as text
%        str2double(get(hObject,'String')) returns contents of nmax as a double


% --- Executes during object creation, after setting all properties.
function nmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCalcola.
function btnCalcola_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalcola (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RAFFAELE : Aggiunti controlli sui campi , mostro un messaggio di errore 
%nel caso di funzione o intervallo non immesso o di warning per
%tol = eps e nmax=500 valori di default
if(~isfield(handles,'funz'))
    errordlg('Inserire funzione per il calcolo','Errore');
    return
end
if(~isfield(handles,'vala') || ~isfield(handles,'valb'))
    errordlg('Inserire estremo a e b per il calcolo','Errore');
    return
end
if(~isfield(handles,'toll'))
    warndlg('Attenzione! : Valore di Tolleranza non specificato, uso eps','Attenzione');
    uiwait(gcf);
    handles.toll = eps;
else
    handles.toll = 10.^(handles.toll);
    %PEPPE ROMITO : Metti qui al posto di questo commento 
    %il controllo di TOL (richiama la funzione con
    %il valore di handles.toll in ingresso) e rimuovi dalla funzione
    %il controllo (isempty(TOL)) dato che lo controlla nell'if sopra 
end
if(~isfield(handles,'nummax'))
    warndlg('Attenzione! : Numero iterazioni massimo non specificato, uso 500 come valore di default','Attenzione');
    uiwait(gcf);
    handles.nummax = 500;
else
    %PEPPE ROMITO : Metti qui al posto di questo commento
    %il controllo di NMAX (richiama la funzione con
    %il valore di handles.nummax in ingresso) e rimuovi dalla funzione
    %il controllo (isempty(NMAX)) dato che lo controlla nell'if sopra 
end
x0 = [handles.vala handles.valb];
handles.funz=inline(handles.funz);
[x, uscita , graf] = algoritmo_di_bisezione(handles.funz,x0,handles.toll,handles.nummax);
acc = CalcoloAccuratezza(handles.funz,x0,handles.toll,handles.nummax);
testo = sprintf('Valore del punto x = %f',x);
testo = sprintf('%s\nValore di f(x) = %f',testo,uscita.fx);
testo = sprintf('%s\nValore di accuratezza = %f',testo,acc);
set(handles.ris,'String',testo);

% --- Executes on button press in btnCheckfzero.
function btnCheckfzero_Callback(hObject, eventdata, handles)
% hObject    handle to btnCheckfzero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RAFFAELE : Definita funzione di Verifica con fzero non appena si clicca
%sul pulsante Confronta con fzero (risolto problema dei grafici
%sovrapposti)
%RAFFAELE : Aggiunti controlli sui campi , mostro un messaggio di errore 
%nel caso di funzione o intervallo non immesso o di warning per
%tol = eps e nmax=500 valori di default
if(~isfield(handles,'funz'))
    errordlg('Inserire funzione per il calcolo','Errore');
    return
end
if(~isfield(handles,'vala') || ~isfield(handles,'valb'))
    errordlg('Inserire estremo a e b per il calcolo','Errore');
    return
end
if(~isfield(handles,'nummax'))
    warndlg('Attenzione! : Numero iterazioni massimo non specificato, uso 500 come valore di default','Attenzione');
    uiwait(gcf);
    handles.nummax = 500;
else
     %PEPPE ROMITO : Metti qui il controllo di NMAX (richiama la funzione con
    %il valore di handles.nummax in ingresso) e rimuovi dalla funzione
    %il controllo (isempty(NMAX)) dato che lo controlla nell'if sopra 
end
x0 = [handles.vala handles.valb];
toll=[10^-1 10^-2 10^-3  10^-4 10^-5 10^-6 10^-7 10^-8 10^-9 10^-10 10^-12 10^-13 10^-14 eps];
Valuta_Performance(inline(handles.funz),x0,toll,handles.nummax);


% --- Executes on button press in btnCasiTest.
function btnCasiTest_Callback(hObject, eventdata, handles)
% hObject    handle to btnCasiTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
