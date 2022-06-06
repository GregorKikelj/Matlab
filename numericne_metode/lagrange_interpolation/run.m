format compact;

%Vander_interp testing  
    x = [1; 2; 3; 4; 6];
    y = [0; -1; 4; 4; 4];
    
    [p, a] = vander_interp(x, y)
    
    %xp = linspace(1, 6, 100);
    %plot(xp, p(xp));
    
    for i=1:size(x)
        [p(x(i)), y(i)]
    end

  