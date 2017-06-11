t=-2:0.01:4;
y=exp(-t).*cos(2*pi*t);
ye=exp(-t);
figure(1)
plot(t, y, 'k', t,ye,'r--', t,-ye,'r--');   %mostra a funcao amortecida
%e seus limitantes em vermelho
grid    %linhas de grid sao postas no grafico da funcao
axis([-2 4 -8 8])   %definido de forma manual o maximo e minimo de cada eixo
hold off
xlabel('t'); ylabel('y(t)'); title('Example 1.18(a)')   %adiciona nome
%aos eixos e o titulo do grafico

figure(2)
t=sym('t'); %cria uma variavel simbolica
x=1+1.5*cos(2*pi*t/10)-.6*cos(4*pi*t/10);   %a variavel simbolica
%eh usada na funcao
ezplot(x,[-10,10]); grid %uma funcao eh esbocada sem calculo dos pontos
xlabel('t'); ylabel('x(t)'); title('Example 1.18(b)')