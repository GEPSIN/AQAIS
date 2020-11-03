% Função para mostrar a imagem e seu histograma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Para usar esta função  passa-se a 'Imagem' que deseeja mostrar, e passa-se 
% o 'Indice' para mostrar a figura, e passa-se a 'Banda'


function Visualizar = Mostra_Imagem (Imagem,Indice,Banda);

%Imagem = rgb2gray(Imagem); % Converte Imagem RGB para escala de cinza
figure(Indice)
subplot(1,2,1);
imshow(Imagem);
title(['Imagem Banda ',num2str(Banda)]);
subplot(1,2,2);
imhist(Imagem);
title(['Histograma Banda ',num2str(Banda)]);