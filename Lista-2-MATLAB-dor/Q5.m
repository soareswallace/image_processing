img = imread('https://cdn.gearpatrol.com/wp-content/uploads/2012/10/slovenia-black-and-white-gear-patrol.jpg');
figure(1);
imshow(img);
title('imagem original');

kernel = [0, -1, 0; -1, 5, -1; 0, -1, 0];

out = uint8(convo2(img, kernel, 'same'));
figure(2);
imshow(out);
title('imagem mais nitida');

%{
para aumentar a nitidez da imagem, precisamos tornar a diferenca de um pixel para o outro mais forte.

entao, o kernel determina o valor do pixel levando em conta:
- o proprio pixel
- as diferencas entre o proprio pixel e os pixels a norte, sul, leste e oeste.
o valor final do pixel sera a soma desses valores.

note que quanto maior a diferenca, mais intensa fica essa diferenca, ja que ela esta sendo incrementada ao valor do pixel.
como podemos notar na imagem, realmente as diferencas estao mais fortes, portanto atingimos nosso objetivo.
%}