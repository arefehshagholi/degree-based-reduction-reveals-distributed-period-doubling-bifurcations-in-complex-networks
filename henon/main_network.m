% Interactive henon network simulation.
entry_dir = fileparts(mfilename('fullpath'));
entry_old_path = path;
try
    addpath(fullfile(fileparts(entry_dir), 'common'));
    paper_run_interactive('henon');
catch entry_error
    path(entry_old_path);
    rethrow(entry_error);
end
path(entry_old_path);
clear entry_dir entry_old_path
