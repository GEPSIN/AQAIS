% Descritor Matriz de co-ocorrência
% Para usar esta função passa a imagem para extrair suas caracteristicas,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Para extrair as caracteristicas com este descritor primeiro tem que
% extrair uma matriz de co-ocrrencia, e com esta matriz extrai as caracteristicas 

function Carac = Descr_Matriz(Imagem) 

% Função para extrair matriz de co-ocorrencia
Mc = graycomatrix(Imagem, 'Offset', [-1 1], 'NumLevels', 256, 'GrayLimits', [0 255], 'Symmetric', false);
% Função para extrair vetores de atributos
Estruct = graycoprops(Mc,{'Contrast', 'Correlation', 'Energy', 'Homogeneity'});
%Estruct = graycoprops(Mc,{'Correlation', 'Energy', 'Homogeneity'});
% Vetores de caracteristicas
Carac = [Estruct.Contrast, Estruct.Correlation, Estruct.Energy, Estruct.Homogeneity];
%Carac = [Estruct.Correlation, Estruct.Energy, Estruct.Homogeneity];