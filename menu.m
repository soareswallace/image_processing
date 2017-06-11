%LISTA 2 - MENU - Sobel, Laplacian e Canny

%----LENDO A IMAGEM E CONVERTENDO----%
img = imread('teste.jpg')

img2 = rgb2gray(img)

img3 = im2double(img2)

%----exibindo a imagem que vai ser usada------%
figure(1)
imshow(img3)

%Sobel (tamS tem que ser 3, 5, 7 ou 9)
tamS = 3
imgS = sobel(img3, tamS)


figure(2)
imshow(imgS)

%Laplacian (tam tem que ser impar!) 
tamL = 3
imgL = laplacian(img3,tamL)

figure(3)
imshow(imgL)

%Canny (tamC indicado=5; sigma indicado = 1)
%tamC = 5
%sigma = 1

%imgC = canny(img3, tamC,sigma);

%figure(4)
%imshow(imgC)
