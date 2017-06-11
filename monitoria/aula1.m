%clear x remove a variavel do workspace ao lado
clear all;  %clear all remove todas as variaveis antes do script ser rodado
t = (-10:0.01:10); %criação de um vetor variando de -10 a 10 com um passo
%de 0.01
y = u(t, -2);    %para ser chamada uma funcao fora do diretorio do matlab
%a funcao u deve estar na mesma pasta do script que a chama
plot(t,y);  %plot mostra o grafico da funcao y, usando t como dominio

figure(2)   %cria uma nova figura para mostrar outro grafico
subplot(1,2,1)  %cria multiplos esbocos de uma funcao em uma figura
plot(t,y)
subplot(1,2,2)  %modifica a posicao do esboco
plot(t, r(t,2))  %uma funcao pode ser calculada na chamada de outra funcao

figure(3)
plot(t, y, '--')    %modifica a linha da funcao desenhada
hold on     %habilita sobreposicao dos graficos
plot(t, r(t,2))
hold off    %desabilita a sobreposicao
%sobreposicao tambem pode ser feito do jeito:
%plot(t,y, t,r(t,2))


%referências de outras funcoes encontram-se em:
% https://www.mathworks.com/help/
