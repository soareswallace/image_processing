%Canny incompleto

function [ image ] = canny(img, tam,sigma)

%-------------------GERANDO A MASCARA DO FILTRO GAUSSIANO----------%
%-
fator = (1/sqrt(2*pi*(sigma^2)));
result = zeros(tam,tam);
a = 2; b = 2;
sigma = 1;
for x=-a:a
 for y=-b:b
 result(x+a+1,y+b+1) ...
 = fator*exp( -(x.^2 + y.^2) ...
 /(2*(sigma.^2)));
 end
end
%normalizando o resultado
result = result./sum(result(:))


%-------------------RESULT = MASCARA DO FILTRO GAUSSIANO----------%

%-------------------aplicando o filtro na imagem------------------%

[linhas,colunas] = size(img);
mascara = result;
 
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
%---------------FIM DA APLICAÇÃO DA MASCARA GAUSSIANA-------------%

%------------ACHANDO O GRADIENTE-------------------------------%

b = image;
b(1:4:end,:) = 1;
[Gx, Gy] = imgradientxy(b);
grad = hypot(Gx, Gy);
theta = atan2(Gy,Gx);
%--------------APLICANDO O GRADIENTE------------------------%
mascara = grad;
 
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
  
%-----------APLICANDO O NON MAX ----------%

image = nonmax(image,theta);

%-----------DOUBLE THRESHOLDING------------%

%-----------INCOMPLETO---------------------%

end

