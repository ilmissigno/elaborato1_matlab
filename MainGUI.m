function varargout = MainGUI(varargin)
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

function MainGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


function varargout = MainGUI_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;



function fun_Callback(hObject, eventdata, handles)
handles.funz = get(hObject,'String');
guidata(hObject,handles);


function fun_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function val_a_Callback(hObject, eventdata, handles)

handles.vala = str2double(get(hObject,'String'));
guidata(hObject,handles);

function val_a_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function val_b_Callback(hObject, eventdata, handles)

handles.valb = str2double(get(hObject,'String'));
guidata(hObject,handles);


function val_b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tol_Callback(hObject, eventdata, handles)

handles.toll = str2double(get(hObject,'String'));
guidata(hObject,handles);


function tol_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nmax_Callback(hObject, eventdata, handles)

handles.nummax = str2double(get(hObject,'String'));
guidata(hObject,handles);


function nmax_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function btnCalcola_Callback(hObject, eventdata, handles)

format longe
funz = get(handles.fun, 'String');
vala = get(handles.val_a, 'String');
valb = get(handles.val_b, 'String');
toll = get(handles.tol, 'String');
nummax = get(handles.nmax, 'String');
if(isempty(funz))
    errordlg('Inserire funzione per il calcolo','Errore');
    return
end
if(isempty(vala) || isempty(valb))
    errordlg('Inserire estremo a e b per il calcolo','Errore');
    return
else
    vala = str2double(vala);
    valb = str2double(valb);
end
if(isempty(toll))
    warndlg('Attenzione! : Valore di Tolleranza non specificato, uso eps','Attenzione');
    uiwait(gcf);
    toll = eps;
else
    toll = str2double(toll);
    if(toll>=0)
        errordlg('Esponente specificato positivo! Il valore di tolleranza deve essere molto piccolo, inserire un esponente negativo.','Errore');
        return
    else
        toll = 10.^(toll);
        controllo_TOL(toll);
    end
end
if(isempty(nummax))
    warndlg('Attenzione! : Numero iterazioni massimo non specificato, uso 500 come valore di default','Attenzione');
    uiwait(gcf);
    nummax = 500;
else
    nummax = str2double(nummax);
    controllo_NMAX(nummax);
end
x0 = [vala valb];
funz=inline(funz);
answer = questdlg('Vuoi visualizzare il grafico della funzione?','Visualizza Grafico','Si','No','No');
switch answer
    case 'Si'
        [x, uscita , graf] = algoritmo_di_bisezione(funz,x0,toll,nummax);
    case 'No'
        [x, uscita] = algoritmo_di_bisezione(funz,x0,toll,nummax);
end
acc = CalcoloAccuratezza(funz,x0,toll,nummax);
testo = sprintf('Valore del punto x = %.16e',x);
testo = sprintf('%s\nValore di f(x) = %s',testo,num2str(uscita.fx));
testo = sprintf('%s\nValore di accuratezza = %.16e',testo,acc);
set(handles.ris,'String',testo);

function btnCheckfzero_Callback(hObject, eventdata, handles)

funz = get(handles.fun, 'String');
vala = get(handles.val_a, 'String');
valb = get(handles.val_b, 'String');
nummax = get(handles.nmax, 'String');
if(isempty(funz))
    errordlg('Inserire funzione per il calcolo','Errore');
    return
end
if(isempty(vala) || isempty(valb))
    errordlg('Inserire estremo a e b per il calcolo','Errore');
    return
else
    vala = str2double(vala);
    valb = str2double(valb);
end
if(isempty(nummax))
    warndlg('Attenzione! : Numero iterazioni massimo non specificato, uso 500 come valore di default','Attenzione');
    uiwait(gcf);
    nummax = 500;
else
    nummax = str2double(nummax);
    controllo_NMAX(nummax);
end
x0 = [vala valb];
toll=[10^-1 10^-2 10^-3  10^-4 10^-5 10^-6 10^-7 10^-8 10^-9 10^-10 10^-12 10^-13 10^-14 eps];
Valuta_Performance(inline(funz),x0,toll,nummax);


function btnCasiTest_Callback(hObject, eventdata, handles)
% DA INSERIRE COLLEGAMENTO A PDF CASI TEST


function btnInfo_Callback(hObject, eventdata, handles)

open('LiveScript/Documentazione_Bisezione.pdf')