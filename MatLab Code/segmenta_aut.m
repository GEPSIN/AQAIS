% Função usada para segmentar imagem do rio sem nuvens, Passa-se a banda 5
% e banda 2 das imagens de satelite
function imag = segmenta_aut(B2,B5)

aut=figure(1);
[corteb5,p] = imcrop(B5); %ja corta a imagem nas coordenadas indicadas
c2 = imcrop(B2,p); %ja corta a imagem nas coordenadas indicadas
level = graythresh(corteb5); % escolhe um limiar para dividir a imagem em dois grupos
BW1 = im2bw(corteb5,level); % segmenta a imagem em dois grupos a partir do level(level varia 0 a 1)
BW1 = ~BW1; 
%pause;
BW = bwareaopen(BW1,1000);
BW = ~BW;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DB = size(corteb5); % Tamanho da imagem
% Cola a mascara na imagem
for i=1: DB(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j=1 : DB(1,2) % percorrer coluna da imagem (Pixel a Pixel)
       if BW(i,j) == 0
            v(i,j) = c2(i,j); % Imagem com a selação da mascara
       end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DB1=size(v); % Tamanho da imagem
% Deixa na imagem somente area do rio
for i=1: DB1(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j=1 : DB1(1,2) % percorrer coluna da imagem (Pixel a Pixel)
       if v(i,j) == 0 
            v(i,j) = 65535; % brancona imagem
       end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imag = v; % entrega imagem segmentada do rio
close(aut);