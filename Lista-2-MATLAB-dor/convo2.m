
function z = convo2(img, kern, ~)
  str = 'full';
  same = 'same';
  img = double(img);
  kern = double(kern);
  [m, n] = size(img);
  [x, y] = size(kern);
  filas = m + x - 1;
  col = n + y - 1;
  z = zeros(filas, col);
  for i = 1:filas
    for j = 1:col
      for k = max(1, i + 1 - x):1:min(i, m)
        for l = max(1, j + 1 - y):1:min(j, n)
          z(i, j) = z(i,j) + img(k, l) * kern(i - k + 1, j - l + 1);
        end
       end
     end
  end
  %if(strcmp(str,same))
  %  cut1 = floor(x / 2);
  %  cut2 = floor(y / 2);
  %  z = z((cut1 + 1):(end - cut1), (cut2 + 1):(end - cut2));
  %end
end