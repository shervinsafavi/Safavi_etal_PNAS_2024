function srchpth = def_srchpth(dirPath_cribay)
cntr = 0;

%% basics 
cntr = cntr + 1; srchpth{cntr} = [dirPath_cribay.src, filesep, 'methods'];
cntr = cntr + 1; srchpth{cntr} = [dirPath_cribay.src, filesep, 'helpers'];

%% project specifics
cntr = cntr + 1; srchpth{cntr} = [dirPath_cribay.smlt, filesep, ...
    'EEnet_Chalk'];
cntr = cntr + 1; srchpth{cntr} = [dirPath_cribay.smlt, filesep, ...
    'EEnet_Chalk', filesep, 'mc_elife'];

% for figues of effCodCriticality
cntr = cntr + 1; srchpth{cntr} = [dirPath_cribay.viz, filesep, ...
    'papers', filesep, 'effCodCriticality'];
    
