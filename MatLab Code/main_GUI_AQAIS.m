
function varargout = main_GUI_AQAIS(varargin)
% main_GUI_AQAIS MATLAB code for main_GUI_AQAIS.fig
%      main_GUI_AQAIS, by itself, creates a new main_GUI_AQAIS or raises the existing
%      singleton*.
%
%      H = main_GUI_AQAIS returns the handle to a new main_GUI_AQAIS or the handle to
%      the existing singleton*.
%
%      main_GUI_AQAIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in main_GUI_AQAIS.M with the given input arguments.
%
%      main_GUI_AQAIS('Property','Value',...) creates a new main_GUI_AQAIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_GUI_AQAIS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_GUI_AQAIS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_GUI_AQAIS

% Last Modified by GUIDE v2.5 10-Oct-2020 20:36:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_GUI_AQAIS_OpeningFcn, ...
                   'gui_OutputFcn',  @main_GUI_AQAIS_OutputFcn, ...
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


% --- Executes just before main_GUI_AQAIS is made visible.
function main_GUI_AQAIS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_GUI_AQAIS (see VARARGIN)

% Choose default command line output for main_GUI_AQAIS
handles.output = hObject;
handles.v = 0;  % inicializa a varaivel que escolhe a imagem
handles.ver = 0; %iniciliza variavel que escolhe o grupo de estado
handles.k=0; % Inicializa variavel que indica que processamento foi feito(com nuvens ou sem nuvens)
% Update handles structure
%|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(handles.v==0) % Se nao estiver selecionado nenhuma imagem mostra logo da interface
    logo=imread('final.png'); %lê a imagem de descanso de tela.
    ty = sprintf('SELECIONE UMA IMAGEM');
    handles.v = 0;  % inicializa a varaivel que escolhe a imagem
    set(handles.Caixa_texto_IQA,'string',ty); % Mostra mensagem de texto na interface
    home=imshow (logo); 
    axes(handles.axes5); %seta a imagem no painel de visualização
    home=imshow (logo); 
    axes(handles.axes4); %seta a imagem no painel de visualização
    imshow (logo) %exibe a imagem na tela 
end
guidata(hObject, handles);

% UIWAIT makes main_GUI_AQAIS wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes when Painel is resized.
function Painel_SizeChangedFcn(hObject, eventdata, handles)
handles = guidata (hObject);

guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = main_GUI_AQAIS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Botão para mostrar logo da interface
function Home_Callback(hObject, eventdata, handles)
handles = guidata (hObject); %torna a imagem utilizavel para todas as funções.
logo = imread('final.png'); %lê a imagem de descanso de tela.
ty = sprintf('SELECIONE UMA IMAGEM');
handles.v = 0;  % inicializa a varaivel que escolhe a imagem
set(handles.Caixa_texto_IQA,'string',ty); % Mostra mensagem de texto na interface
home=imshow (logo);
axes(handles.axes5); %seta a imagem no painel de visualização
home=imshow (logo); 
axes(handles.axes4); %seta a imagem no painel de visualização
imshow (logo) %exibe a imagem na tela
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Botão (função) que seleciona imagem da banda 5
function Browser_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
[filename, pathname] = uigetfile({'*.tif';'*.jpg';'*.bmp'},'File Selector'); %puxa o nome do arquivo por caixa de dialogo
handles.v=1; % seta variavel v, indicando que foi selecionada a imagem
handles.B5 = imread(fullfile(pathname,'B5.tif')); %'B5.tif'); % Faz leitura da banda 5
handles.B2 = imread(fullfile(pathname,'B2.tif')); %'B2.tif'); % Faz leitura da banda 2
handles.image = strcat(pathname, filename); %concatena duas strings
axes(handles.axes4); %seta a imagem lida no axe4
imshow(handles.image) %exibe a imagem
set(handles.Caixa_texto_IQA,'string',filename); % Mostra mensagem de texto na interface
% set(handles.edit2,'string',handles.image);
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Botão (função) faz segmentação de imagem sem nuvens ao redor do rio
function Automatic_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v == 1) % verifica se foi selecionada alguma imagem
    if(handles.ver==0) % Verifica se foi selecionado algum grupo de estados
        ty = sprintf('SELECIONE UM GRUPO DE ESTADOS'); % Mostra mensagem
        set(handles.Caixa_texto_IQA,'string',ty); % mostra mensagem de texto 
    else
        handles.k=1; % indica que foi feito segemtação sem nuvens
        handles.ver=0; % reseta variavel que seleciona que indica seleção de grupo de estados
        gray1 = segmenta_aut(handles.B2,handles.B5); % Função usada para fazer segmentação autmatica(sem nuvens)
        gray2 = Trans_Lin(gray1); % Função usada para fazer expansão linear por saturação
        [ty, handles.image1] = Filtro_Laplaciano(gray2); % Função usada para aplicar filtro laplaciano
        axes(handles.axes5); 
        imshow (handles.image1); % mostra imagem depois de etapa de processamento
    end % fim if(handles.vER==0)
else
        ty = sprintf('SELECIONE UMA IMAGEM');
        set(handles.Caixa_texto_IQA,'string',ty);
end % FIM if(handles.v==1)
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Função usada para mostrar ensagem de texto na interface
function Caixa_texto_IQA_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Função usada para fazer fazer segmentação de rio com nuvens ao redor
function Manual_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v == 1) 
    if(handles.ver==0)
        ty = sprintf('SELECIONE UM GRUPO DE ESTADOS');
        set(handles.Caixa_texto_IQA,'string',ty);
    else
        handles.k=2; % indica que foi selecionada segmentação manual
        handles.ver = 0;
        gray10 = segmenta_man(handles.B2,handles.B5); % função usada para segmentação manual
        gray20 = Trans_Lin(gray10);
        [ty, handles.image2] = Filtro_Laplaciano(gray20);
        axes(handles.axes5);
        imshow (handles.image2);
    end % fim if(handles.ver==0)
    else
        ty = sprintf('SELECIONE UMA IMAGEM');
        set(handles.Caixa_texto_IQA,'string',ty);
end % FIM if(handles.v==1)
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Função usada para fazer classificação de imagem, e indicar qualidade do
% rio
function Classify_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v == 1) % Indica que houve a seleção de uma imagem
    if(handles.Res == 1)  % seleciona grupo de estaddos AL,MG,MT,PR,RJ,RN,RS
        load dados_GP1 % Seleciona banco de dados referente a este grupo de estado
    end % fim if(handles.Res == 1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(handles.Res == 2) % seleciona grupo de estados BA,CE,ES,GO,MS,PB,SP
        load dados_GP2 % Seleciona banco de dados referente a este grupo de estado
    end % fim if(handles.Res == 2)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(handles.k==1) % Modo automatico de segmentação(sem nuvens)
        g = Descr_Matriz(handles.image1); % Extrai caracteristicas da imagem do rio
        h = [g(1) g(2) g(3) g(4)]; % Agrupa descritores extraídos da imagem do rio
        C = Classificador_B_LDA(h, vector_MC,handles.Res); % Classifica imagem, compara caraceriticas extraida da imahem e compara com banco de dados
        if(handles.Res==1) % grupo 1 de estados AL,MG,MT,PR,RJ,RN,RS
            if(C==1) % inidca grupo que representa qualidade de agua
                ty = sprintf('RAZOAVEL');
                set(handles.Caixa_texto_IQA,'string',ty);
            end % fim if(C==1)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C==2) 
                ty = sprintf('BOA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end % fim  if(C==2) 
        end % fim if(handles.Res==1)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(handles.Res==2) % grupo 2 de estados BA,CE,ES,GO,MS,PB,SP
            if(C==1)
                ty = sprintf('RAZOAVEL');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C==2) 
                ty = sprintf('BOA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C==3)
                ty = sprintf('OTIMA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end % fim if(handles.Res==2)
        handles.v = 0; % reseta a variavel que indica que foi selecionada uma imagem
        handles.k=0; % reseta variavel que indica modo de segmentação
    end % fim (handles.k==1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(handles.k==2) % indica que foi selecionada segmentação manual(com nuvens)
        g1 = Descr_Matriz(handles.image2);
        h1 = [g1(1) g1(2) g1(3) g1(4)];
        C1 = Classificador_B_LDA(h1, vector_MC,handles.Res);
         if(handles.Res==1) % grupo 1 de estados
            if(C1==1)
                ty = sprintf('RAZOAVEL');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C1==2) 
                ty = sprintf('BOA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(handles.Res==2) % grupo 2 de estados
            if(C1==1)
                ty = sprintf('RAZOAVEL');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C1==2)
                ty = sprintf('BOA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if(C1==3)
                ty = sprintf('OTIMA');
                set(handles.Caixa_texto_IQA,'string',ty);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end % fim (handles.k==2)
        handles.v = 0; 
        handles.k=0;
    end % fim if(handles.k==2)
    else
        ty = sprintf('SELECIONE UMA IMAGEM');
        set(handles.Caixa_texto_IQA,'string',ty);
end %fim if(handles.v == 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(handles.k==0 && handles.v==1) % indica que foi selecionada imagem mais nao foi feita etapa de processamento
        ty = sprintf('AINDA NÃO FOI FEITA ETAPA DE PROCESSAMENTO');
        set(handles.Caixa_texto_IQA,'string',ty); 
end % fim if(handles.k==0 && handles.v==1)
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostra imagem e histigrama da banda 2
function Histogram_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v == 1) % indica que selecionou imagem
    if(handles.k==1) % indica que foi feita a etapa de processamento segmentação sem nuvens
        imshow(handles.image1); % mostra imagem banda 2
        axes(handles.axes4);
        imhist(handles.image1); % extrai histograma da imagem
        axis([0 65535 0 15000]);
        axes(handles.axes5);
    end % fim if(handles.k==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(handles.k==2) % indica que foi feita a etapa de processamento segmentação com nuvens
        imshow(handles.image2);
        axes(handles.axes4);
        imhist(handles.image2);
        axis([0 65535 0 15000]);
        axes(handles.axes5);
    end % fim if(handles.k==2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
   ty = sprintf('SELECIONE UMA IMAGEM');
   set(handles.Caixa_texto_IQA,'string',ty); 
end %% if(handles.v==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(handles.k==0 && handles.v==1) % indica que foi selecionada imagem porem nao foi feita etapa de processamento
        ty = sprintf('AINDA NÃO FOI FEITA ETAPA DE PROCESSAMENTO');
        set(handles.Caixa_texto_IQA,'string',ty); 
end % fim if(handles.k==0 && handles.v==1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Função para selecionar grupo de estados
function Grupo_1_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v == 1) % indica que foi selecionada uma imagem
    handles.ver = 1; % seta variavel indicando que foi feita a seleção de um grupo de estados pra processamento
    handles.Res = 1; % seta variavel indicando que foi feita a seleção de um grupo de estados pra classificação
    ty = sprintf('Estados: AL,MG,MT,PR,RJ,RN,RS');
    set(handles.Caixa_texto_IQA,'string',ty);
else
    ty = sprintf('SELECIONE UMA IMAGEM');
    set(handles.Caixa_texto_IQA,'string',ty);
end % fim if(handles.v == 1)
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Botão (função) para selecionar grupo de estados
function Grupo_2_Callback(hObject, eventdata, handles)
handles = guidata (hObject);
if(handles.v==1)
    handles.ver = 1;
    handles.Res = 2;
    ty = sprintf('Estados: BA,CE,ES,GO,MS,PB,SP');
    set(handles.Caixa_texto_IQA,'string',ty);
else
    ty = sprintf('SELECIONE UMA IMAGEM');
    set(handles.Caixa_texto_IQA,'string',ty);
end
guidata (hObject, handles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%de
