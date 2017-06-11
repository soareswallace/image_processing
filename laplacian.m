%Laplacian prxc

%{
CADA ELEMENTO DA MASCARA É MULTIPLICADO PELO VALOR DO PIXEL CORRESPONDENTE
NA IMAGEM; A SOMA DESSES RESULTADOS É O NOVO VALOR DO PIXEL NA NOVA
IMAGEM.
%}
function [ image ] = laplacian(img, tam)
  [linhas,colunas] = size(img);

%--criando a mascara------% 

mascara = ones(tam,tam)
mascara = mascara.*(-1)
central = ceil(tam/2)
mascara(central,central) = ((tam.*tam)-1)

 
  nova_img = zeros(linhas+2,colunas+2);
  nova_img = cast(nova_img, class(img));

  nova_img(2:end-1,2:end-1) = img;

  image = zeros(size(nova_img));
  image = cast(image, class(img));

  for i=2:1:linhas+1
    for j=2:1:colunas+1
      val=0;
      for g=-1:1:1
        for l=-1:1:1
          val=val+nova_img(i+g,j+l)*mascara(g+2,l+2);
        end
      end
     image(i,j)=val;
    end
  end

%// Change
%// Crop the image and remove the extra border pixels
image = image(2:end-1,2:end-1);