function run_simulation
% Start from the package root: run_simulation
root = fileparts(mfilename('fullpath'));
old_path = path;
restore = onCleanup(@() path(old_path)); %#ok<NASGU>
addpath(fullfile(root, 'common'));
paper_run_interactive;
end
