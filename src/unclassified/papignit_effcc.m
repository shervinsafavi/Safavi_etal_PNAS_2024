function papignit_effcc()
% temporary path for data files
% fcc : eff Cod Criticality

global pds

% ignit_cribay

pds.data.rep.effcc =  fullfile(pds.lda, 'papers', 'effCodCriticality');
pds.vizs.rep.effcc =  fullfile(pds.rep, 'papers', 'effCodCriticality');
% dsd : data serv directory
% ignit_datsrv should idealy give a dsd which is used here
ignit_datsrv
% osd output-specific directory
osd.dsd = fullfile(pds.datsrv.rep, 'effCodCriticality');
osd.on = 'effCodCriticality';
effcc.dsd = fullfile(pds.datsrv.rep, 'effCodCriticality');
pds.effcc = effcc;
% the two above are reduendt in newer versions, we only need the osd

% pds.effcc.dsd = fullfile(mds.crd, 'clouddata', pds.pn,...
% %                                'papers', 'effCodCriticality');

% the idea is void
% % this is a new way of organizing that everything related to this
% % partciular paper
% mds = get_mds()
% pds.effcc.cda = fullfile(mds.crd, 'clouddata', pds.pn,...
%                                'papers', 'effCodCriticality');

addpath('.')