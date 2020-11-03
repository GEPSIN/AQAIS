% Função para extrair caracterisiticas de imagem pelo metodo 
% histograma diferença de cinza, para usar essa função passa-se a imagem e
% a direção para fazer a subtraçãoe a distancia dos pixeis

function valor = His_dif_cinza(imagem, dis, direc)

DB = size(imagem);
imagem = double(imagem);
switch(direc)
    case 1 % 0 graus
        difer = imagem(:,1:end-dis) - imagem(:,1+dis:end);
        case 2 % 90 graus
            difer = imagem(1:end-dis,:) - imagem(1+dis:end,:); 
            case 3 % 45 graus
                difer = imagem(1:end-dis,1:end-dis) - imagem(1+dis:end,1+dis:end);
                case 4 % -45 graus 
                    difer = imagem(1:end-dis,1+dis:end) - imagem(1+dis:end,1:end-dis);
end
    [contB, indiB] = imhist(uint8(abs(difer)));
    
    P = contB/(DB(1,1)*DB(1,2)); % Densidade de probalidade de um conjunto
    
    media = sum(indiB.*P);
    variancia = sum((indiB - media).^2.*P);
    assimetria = sqrt(variancia)^(-3)*sum((indiB - media).^3.*P);
    curtose = sqrt(variancia)^(-4)*sum((indiB - media).^3.*P);
    energia = sum(P.^2);
    c = 0.01; % constante para não calcular log2(0)
    entropia = -sum(P.*log2(P+c));
    valor = [media, variancia, assimetria, curtose, energia,  entropia];  
end
 