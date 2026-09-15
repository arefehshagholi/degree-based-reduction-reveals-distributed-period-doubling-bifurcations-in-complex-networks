function extract_cluster_matrices(network_filename)
system_dir = fileparts(mfilename('fullpath'));
repo_root = fileparts(system_dir);
net = load(fullfile(repo_root, 'data', 'networks', network_filename));
A = net.A; N = length(A); A(1:N+1:end) = 0;
degrees = sum(A, 2); [unique_degrees, ~, cluster_indices] = unique(degrees); m = length(unique_degrees);
mat_folder = 'cluster_matrices'; if ~exist(mat_folder, 'dir'), mkdir(mat_folder); end
for c = 1:m
    cluster_nodes = find(cluster_indices == c);
    temp_A = zeros(N); temp_A(cluster_nodes, :) = A(cluster_nodes, :);
    filename = sprintf('cluster_%d_degree_%d.mat', c, unique_degrees(c));
    save(fullfile(mat_folder, filename), 'temp_A', 'cluster_nodes');
end
end
