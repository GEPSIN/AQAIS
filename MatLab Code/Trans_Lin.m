% Função para aplicar realce linear em uma imagem
% Para usar esta função passa-se a imagem de uma banda
% E função retorna uma imagem com realce linear aplicado

function Imag_Rea_Lin = Trans_Lin (Banda)
% Armazenamento de tamanho da matriz (Linha x Coluna) Banda 4
DB = size(Banda);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Amplicação de realce linear 
% Equação linear para realce linear
%Vs=(255/MAX-MIN)*(B2(i,j)-MIN);
%MAX = maior valor digital no histograma da imagem
%MIN = menor valor digital no histograma da imagem
%B(i,j)= Valor dos pixels da imagem da Banda  (Pixel a Pixel)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mx4=0;
for i4=1: DB(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j4=1 : DB(1,2) % percorrer coluna da imagem (Pixel a Pixel)
        if  Banda(i4,j4)> 0 % Valor minimo
            mn4(i4,j4) = Banda(i4,j4);
        end
        if  Banda(i4,j4) < 65535 % valor maximo
            mx4(i4,j4) = Banda(i4,j4);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Identifica o valor maximo e minimo do pixel na imagem da banda 4
n4 = max(mx4);
o4 = min(mn4);
max4 = max(n4);
min4 = min(o4);
% Conversão inteiro 16 bits para double
n4 = double(n4);
o4 = double(o4);
max4 = double(max4);
min4 = double(min4);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Banda = double(Banda); % Conversão de inteiro 16 bits para bouble
Imag_Rea_Lin = (65535/(max4-min4))*(Banda - min4); % Equação realce linear
Imag_Rea_Lin = uint16(Imag_Rea_Lin); %conversão de double para inteiro 16 bits
%==========================================================================
