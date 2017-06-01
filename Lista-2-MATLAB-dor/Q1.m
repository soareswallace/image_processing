vec = [100 120 124 125 122 123 154 21 23 22 28 21 21 22 255 253 252];
kern = [1 -1];

out = convo(vec, kern);
out = out(2:(end - 1));
disp(out);
%{
a maior variacao positiva eh 233 da posicao 14 para a 15
a maior variacao negativa eh -133 da posicao 7 para a 8

a convolucao foi util pois a convolucao com a derivada do impulso unitario retorna a derivada da funcao.
a derivada nos diz a variacao de um ponto ao outro.
assim, conseguimos obter os pontos de maior variacao.
%}