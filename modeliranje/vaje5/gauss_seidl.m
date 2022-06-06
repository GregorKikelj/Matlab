function U = gauss_seidl(U,iters)
% GAUSS_SEIDL izvaja Gauss-Seidlovo metodo direktno
% na mrezi U, ki predstavlja diskretizacijo kvadrata
% [-a,a] x [-a,a]. V vsakem koraku iteracije je vsak element
% izracunan kot povprecje njegovih stirih sosedov.
% Pri tem je U matrika z niclami v notranjosti in
% vrednostmi na robu, dolocenimi z robnimi pogoji.
    
    n = size(U, 1);
    [X, Y] = meshgrid(linspace(0, 1, n));
    for iter=1:iters
        for i=2:n-1
            for j=2:n-1
                U(i,j)=(U(i-1,j)+U(i, j-1)+U(i+1, j)+U(i, j+1)+U(i,j))/5;
            end
        end
        if mod(iter, 100)==1
            graf = surf(X, Y, flipud(U));
            pause(0.1);
        end
        if mod(iter, 100)==99
            delete(graf)
        end

    end
    surf(X, Y, flipud(U));
end
