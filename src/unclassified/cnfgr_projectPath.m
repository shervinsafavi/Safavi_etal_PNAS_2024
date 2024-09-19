function dirPath = cnfgr_projectPath(varargin)
% cribay
% dirPath = cnfgr_cribayProjectPath(dirPath)

dirPath.pn                  = 'cribay';

[~, rawMachineName] = system('hostname'); 
% machineName = tmp(1:end-1);

% global dirPath_global 

if contains(rawMachineName, 'win348')    
    dirPath.lab         = [filesep, 'media', filesep, 'mpivision2', ...
                        filesep, 'projects'];
    dirPath.usr                 = [dirPath.lab, filesep, 'shervin'];
    dirPath.project             = [dirPath.usr, filesep, 'research', filesep, 'csb', filesep, 'cribay']; 


elseif contains(rawMachineName, 'node7')    
    dirPath.lab         = fullfile(filesep, 'mnt', 'mpivision2_usrlab', ...
                                   'projects');
    dirPath.usr                 = [dirPath.lab, filesep, 'shervin'];
    dirPath.project             = [dirPath.usr, filesep, 'research', filesep, 'csb', filesep, 'cribay']; 


elseif contains(rawMachineName, 'uwks59')    
    dirPath.lab         = [filesep, 'media', filesep, 'mpivision2', ...
                        filesep, 'projects'];
    dirPath.usr                 = [dirPath.lab, filesep, 'shervin'];
    dirPath.project             = [dirPath.usr, filesep, 'research', filesep, 'csb', filesep, 'cribay']; 

elseif contains(rawMachineName, 'sssptpw')    
    dirPath.lab         = [filesep, 'media', filesep, 'mpivision2', ...
                        filesep, 'projects'];
    ts = get_mds;
    dirPath.usr                 = ts.wd;
    dirPath.project             = [dirPath.usr, filesep, 'research', filesep, 'cribay']; 

elseif contains(rawMachineName, 'ssspdxps13')    
    dirPath.lab         = [filesep, 'media', filesep, 'mpivision2', ...
                        filesep, 'projects'];
    ts = get_mds;
    dirPath.usr                 = ts.wd;
    dirPath.project             = [dirPath.usr, filesep, 'research', filesep, 'cribay']; 
    
else 
    error('Machine name is not recognized')    
end

% switch machineName
%   case 'win348'
%     TF = contains(tmp,'win348')    
%     % if Linux
%     dirPath.lab         = [filesep, 'media', filesep, 'mpivision2', filesep, 'projects'];
%     %         dirPath.dsd         = [filesep, 'media', filesep, 'data_san53']; % dsd = Data Storage Drive
%     % elseif mac
%     %     c

%     % elseif windoes 
%     %     
%     % end
%   case 'blackrock2'
%     dirPath.lab         = ['L:', filesep, 'projects'];
%     %         dirPath.dsd         = ['M:', filesep, 'data_san53']; % dsd = Data Storage Drive

%   case 'node7'
%     dirPath.lab         = fullfile(filesep, 'mnt', 'mpivision2_usrlab', 'projects');
    
%   case 'macbook-ssafavi'
%     dirPath.lab         = [filesep, 'Volumes', filesep, 'usrlab', filesep, 'projects'];
%   otherwise
%     error('case is not considered')
% end

dirPath.src                 = [dirPath.project, filesep, 'src']; 
dirPath.sandbox             = [dirPath.src, filesep, 'sandbox']; 
dirPath.smlt                = [dirPath.src, filesep, 'simulations']; 
dirPath.viz                 = [dirPath.project, filesep, 'visualizations'];   % 
dirPath.lda                 = [dirPath.project, filesep, 'localdata']; 

dirPath.rep                 = [dirPath.project, filesep, 'reports']; 

% dirPath.data                = [dirPath.project, filesep, 'data']; % prcd = processed
dirPath.data.prcd           = [dirPath.project, filesep, 'data', filesep, 'processed'];     % prcd = processed
dirPath.data.smlt           = [dirPath.project, filesep, 'data', filesep, 'simulated'];     % smlt = simulated
dirPath.data.explr          = [dirPath.project, filesep, 'data', filesep, 'exploratory'];   % explr = exploratory


% dirPath.data.uate2010       = [dirPath.dsd, filesep, 'shervin_processedDataSets', filesep, 'Ephys_UA'];

%% 
% addpath([dirPath.researcher, filesep, 'research', filesep, ...
%     'researchIngredients', filesep, 'utilities', filesep, 'codes', filesep, ...
%     'matlab', filesep, 'neuralDataModeling'])

% clear tmp machineName

% dirPath_global = dirPath;
