function [x_new, y_new, phi_new] = main_func(x, y, phi, G)
N = length(x);
a = 0.89; b = 0.18; c = 0.28; r = 0.9; e = 1; I = 0.005; k = .142;
v_s = -40; k_s = 50; theta_s = -40;
chemical_coupling = zeros(N,1);
for i = 1:N
    for j = 1:N
        chemical_coupling(i) = chemical_coupling(i) + G(i,j)*(v_s - x(i))/(1 + exp(-k_s*(x(j)-theta_s)));
    end
end
x_new = x.^2 .* exp(y - x) + I + k .* tanh(phi) .* x + chemical_coupling;
y_new = a * y - b * x + c;
phi_new = r * phi + e * x;
end
