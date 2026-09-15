function [x_new, y_new] = main_func(x, y, G)

N = length(x);
v_s = -40; k_s = 50; theta_s = -40; b = 0.3; a = 1;
chemical_coupling = zeros(N,1);
for i = 1:N
    for j = 1:N
        chemical_coupling(i) = chemical_coupling(i) + G(i,j)*(v_s - x(i))/(1 + exp(-k_s*(x(j)-theta_s)));
    end
end
x_new = 1 - a*x.^2 + y + chemical_coupling;
y_new = b*x;
end
