function paper_run_interactive(system_id)
root = fileparts(fileparts(mfilename('fullpath')));
systems = {'henon', 'mchialvo', 'rossler'};
if nargin == 0
    fprintf('\nSystems: 1 = Henon, 2 = mChialvo, 3 = Rossler\n');
    system_id = systems{ask_number('System number', 1, 1, 3, true)};
end
assert(any(strcmp(system_id, systems)), 'Unknown system.');
system_dir = fullfile(root, system_id);
old_path = path; old_dir = pwd;
restore = onCleanup(@() restore_environment(old_path, old_dir)); %#ok<NASGU>
cd(system_dir); addpath(system_dir, '-begin');
clear main_func run_network_simulation calc_beff main_system run_bifurcation extract_peaks
ranges = readtable(fullfile(root, 'data', 'network_ranges.csv'), 'TextType', 'string');
ranges = ranges(strcmp(ranges.system, system_id), :);
assert(height(ranges) == 22, 'Expected exactly 22 network entries.');
fprintf('\n%s networks:\n', upper(system_id));
for i = 1:height(ranges), fprintf('%2d. %-10s (%s)\n', i, char(ranges.network_label(i)), char(ranges.network_file(i))); end
while true
    answer = strtrim(input('Network number, label, or filename [1]: ', 's')); if isempty(answer), answer='1'; end
    index = str2double(answer);
    if ~(isscalar(index) && isfinite(index) && index==fix(index) && index>=1 && index<=height(ranges)), index=find(strcmpi(ranges.network_label,answer)|strcmpi(ranges.network_file,answer),1); end
    if ~isempty(index) && isfinite(index) && index>=1 && index<=height(ranges), break; end
end
selected = ranges(index,:);
network_file = fullfile(root,'data','networks',char(selected.network_file));
assert(isfile(network_file),'Selected network file is missing: %s',network_file);
fprintf('Suggested coupling range: [%.10g, %.10g].\n',selected.suggested_min,selected.suggested_max);
fprintf('Range catalog is based on manually curated/predicted critical-point tables; refine the grid for precise readings.\n');
while true
    wmin=ask_number('Minimum coupling',selected.suggested_min,0,Inf,false); wmax=ask_number('Maximum coupling',selected.suggested_max,0,Inf,false);
    if wmax>wmin, break; end
end
if strcmp(system_id,'rossler'), default_steps=800; else, default_steps=300; end
steps=ask_number('Number of coupling samples',default_steps,2,Inf,true); seed=ask_number('Random seed',1,0,2^32-1,true);
net=load(network_file,'A'); assert(isfield(net,'A')&&isnumeric(net.A)&&ismatrix(net.A)&&size(net.A,1)==size(net.A,2),'Invalid adjacency matrix A.');
A=net.A; A(1:size(A,1)+1:end)=0;
params=struct('wmin',wmin,'wmax',wmax,'w_steps',steps,'seed',seed);
if strcmp(system_id,'rossler'), assert(exist('findpeaks','file')~=0,'Rossler requires findpeaks.'); params.run_time=500; params.tolerance=1e-5; else, params.transient=500; params.steady=50; end
rng(seed,'twister');
metadata=struct('system',system_id,'network_label',char(selected.network_label),'network_filename',char(selected.network_file),'params',params,'critical_point_method','Manual visual reading; no automatic extraction','matlab_version',version,'started_at',datestr(now,30));
[~,network_id]=fileparts(network_file); result_dir=fullfile(system_dir,'results'); if ~exist(result_dir,'dir'),mkdir(result_dir);end
stem=sprintf('%s_%s_%s',system_id,network_id,datestr(now,'yyyymmdd_HHMMSS')); output_base=fullfile(result_dir,stem);
if strcmp(system_id,'rossler')
    [Amat,Xmat]=run_bifurcation(network_file,params.run_time,params.tolerance,wmin,wmax,steps); save([output_base '.mat'],'Amat','Xmat','A','params','metadata','-v7.3'); xdata=Amat; ydata=Xmat;
else
    [Amat1,output_x,Beff]=run_network_simulation(A,params); save([output_base '.mat'],'Amat1','output_x','Beff','A','params','metadata','-v7.3'); xdata=Amat1; ydata=output_x;
end
fig=figure('Color','w'); ax=axes('Parent',fig); hold(ax,'on'); colors=lines(numel(xdata));
for node=1:numel(xdata), plot(ax,xdata{node},ydata{node},'.','Color',colors(node,:),'MarkerSize',3); end
xlabel(ax,'Coupling strength'); ylabel(ax,'x'); title(ax,sprintf('%s | %s',system_id,char(selected.network_label)),'Interpreter','none'); print(fig,[output_base '.png'],'-dpng','-r200');
end
function value=ask_number(label,default,minimum,maximum,integer_only)
while true
 answer=strtrim(input(sprintf('%s [%.10g]: ',label,default),'s')); if isempty(answer),value=default;else,value=str2double(answer);end
 if isscalar(value)&&isfinite(value)&&value>=minimum&&value<=maximum&&(~integer_only||value==fix(value)),return;end
end
end
function restore_environment(old_path,old_dir), cd(old_dir); path(old_path); end
