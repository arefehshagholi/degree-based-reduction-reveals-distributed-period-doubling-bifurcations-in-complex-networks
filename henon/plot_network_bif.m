function plot_network_bif(Amat1, output_x, output_file)
if nargin < 3, output_file = fullfile('results', 'henon_network_bifurcation.png'); end
N = length(Amat1); figure; hold on; colors = lines(N);
for i = 1:N, plot(Amat1{i}, output_x{i}, '.', 'Color', colors(i,:), 'MarkerSize', 5); end
xlabel('g_{ch}'); ylabel('X'); saveas(gcf, output_file);
end
