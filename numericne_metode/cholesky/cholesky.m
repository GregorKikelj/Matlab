function V = cholesky(a)
  n = size(a, 1);
  V = zeros(n, n);
  for i=1:n
      for j=1:i-1
            V(i,j) = (a(i, j) - sum(V(i, 1:j).*V(j,1:j)))/V(j,j);
      end
      V(i,i) = sqrt(a(i,i)- sum(V(i,1:i).^2));
  end
end

