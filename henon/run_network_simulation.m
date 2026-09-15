function [Amat1, output_x, Beff] = run_network_simulation(A, params)
N = size(A,1);
transient = params.transient; steady = params.steady; run_time = transient + steady;
w_values = linspace(params.wmin, params.wmax, params.w_steps);
Amat1 = cell(N,1); output_x = cell(N,1);
L_all = zeros(N, run_time, 2);
L_all(:,1,1) = 0.1*rand(N,1); L_all(:,1,2) = 0.1*rand(N,1);
for g_idx = 1:length(w_values)
    g_ch = w_values(g_idx); A_weighted = g_ch * A;
    for t = 2:run_time
        [L_all(:,t,1), L_all(:,t,2)] = main_func(L_all(:,t-1,1), L_all(:,t-1,2), A_weighted);
    end
    steady_x = L_all(:, end-steady+1:end, 1);
    for i = 1:N
        Amat1{i} = [Amat1{i}, repmat(g_ch,1,steady)];
        output_x{i} = [output_x{i}, steady_x(i,:)];
    end
    L_all(:,1,:) = L_all(:,end,:);
end
Beff = calc_beff(A);
end
