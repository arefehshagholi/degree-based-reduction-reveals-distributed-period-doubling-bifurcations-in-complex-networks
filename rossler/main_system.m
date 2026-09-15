function dM = main_system(t, M, G)
N = size(G, 1); a = 0.165; b = 0.2; c = 10;
x=M(1:N,1); y=M(N+1:2*N,1); z=M(2*N+1:3*N,1);
dM = zeros(size(M)); v_s = -40; k_s = 50; theta_s = -40; e_coupling = zeros(N, 1);
for i = 1:N
    for j = 1:N
        e_coupling(i) = e_coupling(i) + G(i,j)*(v_s - x(i))/(1 + exp(-k_s*(x(j)-theta_s)));
    end
end
dM(1:N,1)=-y-z+e_coupling;
dM(N+1:2*N,1)=x+a*y;
dM(2*N+1:3*N,1)=b+(x-c).*z;
end
