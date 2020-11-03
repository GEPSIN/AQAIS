%Recohecimento de padroes
%Classificador Bayessiano (Linear) = para usar essa função passa-se o vetor de
%caracteristicas da imagem de teste e das imagens de treinamento.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Essa função e baseada no teoreama de bayes, onde avalia a possibilidade do
%vetor de caracteristica de teste ser um dos vetores de treinamento
function [Classe, Erro, Post] = Classificador_B_diagLDA (CaracT, vector, Res)

%Amostra para teste
teste = CaracT;
if(Res==1)
treino = [vector(1:12,:); vector(13:27,:)]; % 6 amostras cada grupo    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grupos de cada uma das amostras de treinamento
grupo = [1*ones(1,12), 2*ones(1,15)];
%==========================================================================
[Classe, Erro, Post] = classify(teste, treino, grupo, 'diagLinear'); % Função usada para classificar
% a imagem de teste com as imagens na classe de treinamento;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Res==2)
treino = [vector(1:6,:); vector(7:23,:); vector(24:34,:)]; % 6 amostras cada grupo    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grupos de cada uma das amostras de treinamento
grupo = [1*ones(1,6), 2*ones(1,17), 3*ones(1,11)];
%==========================================================================
[Classe, Erro, Post] = classify(teste, treino, grupo, 'diagLinear'); % Função usada para classificar
% a imagem de teste com as imagens na classe de treinamento;
end
%==========================================================================