function yroots = durandkerner(f)
    
    syms x;
    deg = polynomialDegree(f); % Getting polynomial degree
    rootvec = zeros(1,deg); % The vector to which the root variables will be assigned
    vector = zeros(1,deg); % Vector with results transferred
    i = 1;
    den = 1; % Variable where the denominator is introduced
    a = 1;
    t=1;

    for i=1:1:deg
        rootvec(i) = complex(i,i); % Variables are assigned beginning value
    end
    for i=1:1:deg
        den = den * (x-rootvec(i)); % Denominator is defined
    end
    % Note: Since the if command causes trouble, a solution has been produced with while.
    while a<100 % Looping for iteration process
     for i=1:1:deg
        den = den / (x-rootvec(i)); % Unnecessary multiplier is removed so that the result does not go to infinity
        t = double(rootvec(i) - subs(f,x,rootvec(i))/subs(den,x,rootvec(i))); % Durand-Kerner formulation
        rootvec(i) = t; % Assigning results from the formula
        vector(i) = t;
        den = den * (x-rootvec(i)); % Unnecessary variable added to the denominator again
     end
        a = a + 1; % loop counter
    end
    yroots = vector; % output values ??are processed to the function output
    
end