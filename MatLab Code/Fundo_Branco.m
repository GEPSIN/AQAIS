%Fazendo o fundo das mascaras branco

function mascara = Fundo_Branco(Imagem)

SizeMask = size(Imagem);

for i4=1: SizeMask(1,1) % percorre linha da imagem (Pixel a Pixel)
    for j4=1 : SizeMask(1,2) % percorrer coluna da imagem (Pixel a Pixel)
        if  Imagem(i4,j4)<= 0
            Imagem(i4,j4) = 65535; %muda fundo da mascara da Banda para branco
        end   
    end
    mascara = Imagem;
end