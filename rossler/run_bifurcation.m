function [Amat, Xmat] = run_bifurcation(network_file, run_time, Er, wmin, wmax, num_w)
data = load(network_file); A = data.A;
N = length(A); A(1:N+1:end) = 0;
options = odeset('RelTol',Er,'AbsTol',Er*ones(3*N,1));
w_values = linspace(wmin,wmax,num_w);
Amat = cell(N,1); Xmat = cell(N,1); init = 0.01*rand(3*N,1);
for k = 1:length(w_values)
    w = w_values(k); Anew = w*A;
    [T,V] = ode15s(@(t,V) main_system(t,V,Anew),[0 run_time],init,options);
    X = V(round(0.8*length(V)):end,1:N);
    [Amat,Xmat] = extract_peaks(X,w,Amat,Xmat);
    init = V(end,:)';
end
end
