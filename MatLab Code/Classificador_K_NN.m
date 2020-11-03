%Recohecimento de padroes
%Classificador K-NN = atribua uma amostra desconhecida(TESTE)a classe das K
%amostra que estejam mais proximas, e analisando a distancia das amostra de
%TESTE defini-se então a classe que tal amostra pertence

function Classes = Classificador_K_NN (CaracT,vector)

%Amostra para teste
teste = CaracT;

%Amostras para treinamento 
treino = [vector(1:6,:); vector(7:12,:)]; % 6 amostras cada grupo

% Calcula a media de cada classe 
Centro1 = mean(treino(1:6,:));
Centro2 = mean(treino(7:12,:));

      
% figure(100)
% hold on; % segura grafico
% % plot das amostras de teste
% plot(teste(1:3,1), teste(1:3,2),'k^'); % Triangulo ponta pra cima preto
% % plot das amostras da classe 1 (Treinamento)
% plot(treino(1:3,1), treino(1:3,2),'k*'); % asteristico preto
% % plot das amostras da classe 2 (Treinamento)
% plot(treino(4:6,1), treino(4:6,2),'rs'); % quadrado vermelho
% % plot das amostras da classe 3 (Treinamento)
% plot(treino(7:9,1), treino(7:9,2),'bp'); % pentagono azul
% % plot das amostras da classe 4 (Treinamento)
% plot(treino(10:12,1), treino(10:12,2),'b>'); % triangulo ponta direita azul
% % plot das amostras da classe 5 (Treinamento)
% plot(treino(13:15,1), treino(13:15,2),'b<'); % triangulo ponta esquerda azul
% % plot das amostras da classe 6 (Treinamento)
% plot(treino(16:18,1), treino(16:18,2),'yh'); % hexagono amarelo
% % plot das amostras da classe 7 (Treinamento)
% plot(treino(19:21,1), treino(19:21,2),'yp'); % Pentagono amarelo
% % plot das amostras da classe 8 (Treinamento)
% plot(treino(22:24,1), treino(22:24,2),'mh'); % hexagono magenta
% % plot das amostras da classe 9 (Treinamento)
% plot(treino(25:27,1), treino(25:27,2),'cs'); % Quadrado azul claro
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Plot do centroide classe 1
% plot(Centro1(1), Centro1(2), 'ko'); % Circulo preto
% % Plot do centroide classe 2
% plot(Centro2(1), Centro2(2), 'ko'); % Circulo preto
% % Plot do centroide classe 3
% plot(Centro3(1), Centro3(2), 'ko'); % Circulo preto
% % Plot do centroide classe 4
% plot(Centro4(1), Centro4(2), 'ko'); % Circulo preto
% % Plot do centroide classe 5
% plot(Centro5(1), Centro5(2), 'ko'); % Circulo preto
% % Plot do centroide classe 6
% plot(Centro6(1), Centro6(2), 'ko'); % Circulo preto
% % Plot do centroide classe 7
% plot(Centro7(1), Centro7(2), 'ko'); % Circulo preto
% % Plot do centroide classe 8
% plot(Centro8(1), Centro8(2), 'ko'); % Circulo preto
% % Plot do centroide classe 9
% plot(Centro9(1), Centro9(2), 'ko'); % Circulo preto
% % Grupos de cada uma das amostras de treinamento
grupo = [1; 2]; % Define qualidade do reservatorio(IQA) de acordo com a 
% classe
K = 1 ; % numero de vizinhos dos atributos de teste mais proximos das classes

Classes = knnclassify(teste, [Centro1; Centro2], grupo, K); % Função usada para classificar
% a imagem de teste com as imagens na classe de treinamento;
%==========================================================================