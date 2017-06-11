%Sobel prxc

%{
CADA ELEMENTO DA MASCARA É MULTIPLICADO PELO VALOR DO PIXEL CORRESPONDENTE
NA IMAGEM; A SOMA DESSES RESULTADOS É O NOVO VALOR DO PIXEL NA NOVA
IMAGEM.
%}

function [ image ] = sobel(img, tam)
  [linhas,colunas] = size(img);

%--Primeiramente aplicamos o filtro Vertical na imagem original------%  
%--mascara vertical--%

if tam == 3
  sobelV = [-1, -2, -1; 0, 0, 0; 1, 2, 1]
end
if tam == 5
    sobelV = [-2 -3 -4 -3 -2; -1 -2 -3 -2 -1; 0 0 0 0 0; 1 2 3 2 1; 2 3 4 3 2];
end
if tam == 7
    sobelV = [-3 -4 -5 -6 -5 -4 -3 -2; -2 -3 -4 -5 -4 -3 -2; -1 -2 -3 -4 -3 -2 -1; 0 0 0 0 0 0 0; 1 2 3 4 3 2 1; 2 3 4 5 4 3 2; 3 4 5 6 5 4 3];
end
if tam == 9
    sobelV = [-4 -5 -6 -7 -8 -7 -6 -5 -4; -3 -4 -5 -6 -7 -6 -5 -4 -3; -2 -3 -4 -5 -6 -5 -4 -3 -2; -1 -2 -3 -4 -5 -4 -3 -2 -1; 0 0 0 0 0 0 0 0 0; 1 2 3 4 5 4 3 2 1; 2 3 4 5 6 5 4 3 2; 3 4 5 6 7 6 5 4 3; 4 5 6 7 8 7 6 5 4];
end
%----------fim mascara vertical ----------------%

  nova_img = zeros(linhas+2,colunas+2);
  nova_img = cast(nova_img, class(img));

  nova_img(2:end-1,2:end-1) = img;

  imageV = zeros(size(nova_img));
  imageV = cast(imageV, class(img));

  for i=2:1:linhas+1
    for j=2:1:colunas+1
      val=0;
      for g=-1:1:1
        for l=-1:1:1
          val=val+nova_img(i+g,j+l)*sobelV(g+2,l+2);
        end
      end
     imageV(i,j)=val;
    end
  end

%// Change
%// Crop the image and remove the extra border pixels
imageV = imageV(2:end-1,2:end-1);

%------Após isso aplicamos na imagem de entrada o filtro Horizontal------%  

%--criando a mascara horizontal------%  
if tam == 3
    sobelH = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
end

if tam == 5
    sobelH = [-2 -1 0 1 2; -3 -2 0 2 3; -4 -3 0 3 4; -3 -2 0 2 3; -2 -1 0 1 2];
end

if tam == 7
    sobelH = [-3 -2 -1 0 1 2 3; -4 -3 -2 0 2 3 4; -5 -4 -3 0 3 4 5; -6 -5 -4 0 4 5 6; -5 -4 -3 0 3 4 5; -4 -3 -2 0 2 3 4; -3 -2 -1 0 1 2 3];
end

if tam == 9
    sobelH = [-4 -3 -2 -1 0 1 2 3 4; -5 -4 -3 -2 0 2 3 4 5; -6 -5 -4 -3 0 3 4 5 6; -7 -6 -5 -4 0 4 5 6 7; -8 -7 -6 -5 0 5 6 7 8; -7 -6 -5 -4 0 4 5 6 7; -6 -5 -4 -3 0 3 4 5 6; -5 -4 -3 -2 0 2 3 4 5; -4 -3 -2 -1 0 1 2 3 4];
end
%-------------------------fim mascara vertical---------------%

  nova_img = zeros(linhas+2,colunas+2);
  nova_img = cast(nova_img, class(img));

  nova_img(2:end-1,2:end-1) = img;

  imageH = zeros(size(nova_img));
  imageH = cast(imageH, class(img));

  for i=2:1:linhas+1
    for j=2:1:colunas+1
      val=0;
      for g=-1:1:1
        for l=-1:1:1
          val=val+nova_img(i+g,j+l)*sobelH(g+2,l+2);
        end
      end
     imageH(i,j)=val;
    end
  end

%// Change
%// Crop the image and remove the extra border pixels
imageH = imageH(2:end-1,2:end-1);

%---- Agora aplicamos o Gradiente através da funcao hypot -----%
%---- esse gradiente "junta" a duas imagens filtradas -----%
image = hypot(imageV,imageH);

end