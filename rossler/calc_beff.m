function Beff = calc_beff(A)
N = size(A,1); degrees = sum(A,2); [unique_deg,~,cluster_idx] = unique(degrees);
m = length(unique_deg); Beff = zeros(1,m);
for c = 1:m
    cluster_nodes = find(cluster_idx == c); node = length(cluster_nodes);
    temp_A = zeros(N); temp_A(cluster_nodes,:) = A(cluster_nodes,:);
    s_out = sum(temp_A,2); s_in = sum(temp_A,1); scluster = sum(temp_A(:));
    Beff(c) = sum(sum(s_out*s_in))/scluster*(1/node);
end
end
