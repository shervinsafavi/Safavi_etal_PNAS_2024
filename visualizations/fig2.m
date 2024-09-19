% This script produce a few panels of figure 2 (remaining panels require large-files)

%% Initialization
clear all
ignit
% ignit_cribay
% papignit_effcc
% ignit_datsrv

%% figure plate
clf

%% load the data 
load(fullfile(pds.data.rep.effcc, ['avData_allEcn', '.mat']))
load(fullfile(pds.data.rep.effcc, ['summaryInfoTable_allEcn', '.mat']))
load(fullfile(pds.data.rep.effcc, ['kappaLike_allEcn', '.mat']))

%% load best kappa

load(fullfile(pds.data.rep.effcc, ['detailsViz_llrAnalysis_percBased', '.mat']))

%% viz init
vc = get_vizConventions();

nR = 2;
nC = 3;

vc.f3.w = 1.5 * 11.4 ;
vc.f3.h = 2.5 * 11.4 / 3;

set_figBasics(vc.f3)

%% network IDs for viz
sel_ecn_ids = vc.f3.sel_ecn_ids;
n_sel_ecn_id = numel(sel_ecn_ids);



%% 
colormapName = 'copper';
vc.f3.ecnColors = copper(n_sel_ecn_id);

%% mse vs noise for all network sizes

osx = 0;
osy = 0;

[~, sbh] = subplot2d(nR,nC, osx+[1], osy+[1]);
vc.f3.percPlotNoise = [-.4 +.9];

for kecn = 1 : n_sel_ecn_id
    kecn_id = sel_ecn_ids(kecn);
    summaryInfoTable_raw = summaryInfoTable_all{kecn_id};
    plot_mseVsNoise2(vc.f3, summaryInfoTable_raw, kecn, 1, 1);
    hold on
end
set_ticksOutward(vc.f2.ts)

tmpXlim = get(gca, 'XLim');
minNoiseVal4diagPlot = tmpXlim(1);

xlim([minNoiseVal4diagPlot, vc.f3.maxNoiseVal4diagPlot])
set(gca, 'xtick', vc.f3.xtick);
vc.f3.ytick_a = [0 3 6]*10e-4;
set(gca, 'ytick', vc.f3.ytick_a);
box off
set(gca, 'fontsize', vc.f2.alfs)

%% kappa vs noise for all network sizes
osx = 0;
osy = 0;
[~, sbh] = subplot2d(nR,nC, osx+[1], osy+[2]);

kselPercNtr = 4; % 4
kselPerc = [9];
for k = 1 : n_sel_ecn_id
    singleEcnCol = vc.f3.ecnColors(k, :);
    kecn_id = sel_ecn_ids(k);
    summaryInfoTable = summaryInfoTable_all{kecn_id};    
    plot_kappVsNoise(vc.f3, summaryInfoTable, devMeasure_all, kecn_id, kselPercNtr, kselPerc, singleEcnCol, 1, 1);
    xlabel('Noise level')
    hold on
end

set_ticksOutward(vc.f2.ts)

xlim([minNoiseVal4diagPlot, vc.f3.maxNoiseVal4diagPlot]);
set(gca, 'xtick', vc.f3.xtick)
set(gca, 'ytick', [0 .5])
box off

set(gca, 'fontsize', vc.f2.alfs)

%%
[lh, icons] = legend(num2str(vc.ecnSize_all(vc.f3.sel_ecn_ids)'), 'location', 'northeast');
displaceFigureStuff(lh, [.04 .08 NaN NaN])
set(lh, 'box', 'off')

bof = 0.38; % backward offset
for k = 8 : 2 :length(icons)
    tmpOrigPos = icons(k).XData(2);
    icons(k).XData(2) = tmpOrigPos - bof; 
end

for k = 1 : 7
    icons(k).Position(1) = 0.3;
end


ylabel('\kappa')
set(gca, 'fontsize', vc.f2.alfs)

%% Note on the remaining panels

% The remaining panels require time consuming computation and/or large files that will be provided upon request (contact research@shervinsafavi.org)
