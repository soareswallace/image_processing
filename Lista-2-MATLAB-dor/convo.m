function y = convo(u, v)
  m = length(u);
  n = length(v);
  tam = m + n - 1;
  w = zeros(1, tam);
  
  for k = 1:tam
    for j = max(1, k + 1 - n):1:min(k, m)
      deb_before = w(k);
      u_de_j = u(j);
      v_de_j = v(k-j+1);
      w(k) = w(k) + (u(j) * v(k - j + 1));
      deb_after = w(k);
    end
  end
  y = w;
end