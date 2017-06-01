same = 'same';
full = 'full';
img = imread('https://cdn.gearpatrol.com/wp-content/uploads/2012/10/slovenia-black-and-white-gear-patrol.jpg');
figure(1);
imshow(img);
title('imagem original');
kernel2 = [0 0 0; 0 1 0; 0 0 0];
kernel3 = [1 1 1; 1 1 1; 1 1 1] / 9;
kernel4 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

out2 = uint8(convo2(img, kernel2, same));
figure(2);
imshow(out2);
title('Filtro da Q2');
%{
o kernel determina o valor do pixel levando em conta:
- o proprio pixel
e tambem nao altera seu valor

portanto, esse kernel retorna a propria imagem
%}

out3 = uint8(convo2(img, kernel3, same));
figure(3);
imshow(out3);
title('Filtro da Q3');
%{
o kernel determina o valor do pixel levando em conta:
- todos os pixels exatamente ao seu redor
- o proprio pixel
o valor do pixel sera a media aritmetica desses pixels

portanto, esse kernel retorna uma imagem embacada/borrada.
%}

out4 = uint8(convo2(img, kernel4, same));
figure(4);
imshow(out4);
title('Filtro da Q4');
%{
o kernel determina o valor do pixel levando em conta:
- a diferenca entre o pixel exatamente a noroeste e o pixel exatamente a nordeste
- a diferenca entre o pixel exatamente a oeste e o pixel exatamente a leste
- a diferenca entre o pixel exatamente a sudoeste e o pixel exatamente a sudeste
dando um peso dobrado a segunda diferenca, ele soma essas diferencas.

note que essas diferencas sao entre pixels a direita e pixels a esquerda.
portanto, esse kernel retorna uma imagem que detecta bordas verticais.
%}

