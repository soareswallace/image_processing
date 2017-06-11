function y = u( t, ads )%funcao degrau
%t - variavel tempo
%ad - variavel de deslocamento: avanco(positivo), atraso(negativo)
N = length(t); %funcao length(x) retorna a maior dimensão da matriz x
y = zeros(1, N); %funcao zeros(a,b) cria uma matriz de tamanho a x b
for i = 1:N    %palavras reservadas como for, while e if
    % possuem final de escopo delimitado pela palavra reservada 'end'
    if t(i) >= -ads    %o acesso de um vetor ou matriz eh feito por '()'
        y(i) = 1;
    end
end
end

