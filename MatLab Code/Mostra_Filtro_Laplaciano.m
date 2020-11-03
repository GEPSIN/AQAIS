% Fun��o para mostrar a imagem com o filtro laplaciano aplicado e seu
% histograma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Para usar esta fun��o Passe os 'Detalhes' real�ados palo filtro, passa-se
% a imagem real�ada('Reace') pelo filtro, e tambem passa-se o 'Indice' para
% mostrar a figura, e passa-se a 'Banda'


function Laplaciano = Mostra_Filtro_Laplaciano (Detalhes,Realce,Indice,Banda);

figure(Indice)
subplot(1,3,1);
imshow(Detalhes);
title(['Detalhes real�ada na Banda ',num2str(Banda)]);
subplot(1,3,2);
imshow(Realce);
title(['Filtro laplaciano na Banda ',num2str(Banda)]);
subplot(1,3,3);
imhist(Realce);
title(['Histograma filtro laplaciano da Banda ',num2str(Banda)]);