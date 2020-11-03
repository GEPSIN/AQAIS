% Função usada para segmentar imagem do rio com nuvens, Passa-se a banda 5
% e banda 2 das imagens de satelite
function imag = segmenta_man(B2,B5)

man = figure(2);
[corteb5,p] = imcrop(B5); %ja corta a imagem nas coordenadas indicadas
c2 = imcrop(B2,p); %ja corta a imagem nas coordenadas indicadas
h = roipoly(corteb5); %criar mascara de maneira manual
%comecando aplicar mascara na b5
maskedImage = corteb5;
maskedImage(~h) = 0; %zerando o fundo da imagem
maskedImage_Final = maskedImage;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DB = size(maskedImage);
for i4=1: DB(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j4=1 : DB(1,2) % percorrer coluna da imagem (Pixel a Pixel)
        if  (maskedImage_Final(i4,j4) == 0 || maskedImage_Final(i4,j4)>= 11000)  % Valor minimo
            maskedImage_Final(i4,j4) = 65535; %fundo branco
        else
            maskedImage_Final(i4,j4) = 0; %rio preto
        end
    end
end
%tira ruido
maskedImage_Final =~maskedImage_Final; % Inverte valores da mascara onde e 0 fica 1 e onde e 1 fica 0
maskedImage_Final = bwareaopen(maskedImage_Final,800); % tira ruidoda mascara 
maskedImage_Final = ~maskedImage_Final; % % Inverte valores da mascara onde e 0 fica 1 e onde e 1 fica 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DB = size(maskedImage_Final); % Tamanho da imagem
% Cola a mascara na imagem
for i=1: DB(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j=1 : DB(1,2) % percorrer coluna da imagem (Pixel a Pixel)
       if maskedImage_Final(i,j) == 0
            v(i,j) = c2(i,j); % Imagem com a selação da mascara
       end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
close(man);