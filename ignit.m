tmpPath = which('ignit');
[phd, ~, ~] = fileparts(tmpPath); % phd : project home directory
                                  
% add necessary routines
addpath(genpath(fullfile(phd, 'src')));


global pds % pds : project directory structure

pds.lda = fullfile(phd, 'localdata'); % lda: local data

pds.data.rep.effcc =  fullfile(pds.lda, 'papers', 'effCodCriticality');
% pds.vizs.rep.effcc =  fullfile(pds.rep, 'papers', 'effCodCriticality');


clear phd tmpPath
