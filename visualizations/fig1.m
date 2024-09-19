% This script produce most panel of figure 1 (except last two panels require large-files)

%% Initialization
clear all
ignit
% ignit_cribay % Initialize the environment and dependencies
% papignit_effcc
vc = get_vizConventions(); % Load visualization conventions

% Figure dimensions
vc.f2.nR = 5; % Number of rows in figure grid
vc.f2.nC = 6; % Number of columns in figure grid
vc.f2.w = 14.4; % Figure width
vc.f2.h = vc.f2.w * vc.f2.nR/vc.f2.nC; % Figure height maintaining aspect ratio

vc.f2.r2xos = 0.03
vc.f2.r2yos = 0.01

set_figBasics(vc.f2); % Set basic figure properties

nR = vc.f2.nR; % Set row count
nC = vc.f2.nC; % Set column count

% parameters will be used for plot

kselPercNtr = 4; % 4
kselPerc_ids = [7];


%% Load data
% Load the data related to efficient coding networks
load(fullfile(pds.data.rep.effcc, ['avData_allEcn', '.mat']));
load(fullfile(pds.data.rep.effcc, ['summaryInfoTable_allEcn', '.mat']));
load(fullfile(pds.data.rep.effcc, ['kappaLike_allEcn', '.mat']));

kecn_id = vc.f2.kecn_id; % Set efficient coding network ID
selSmltIds = [4 13 25]; % Selected simulation IDs

summaryInfoTable = summaryInfoTable_all{kecn_id}; % Load summary info
avsd = avsd_all{kecn_id}; % Load avalanche size distribution

%% Visualization setup
% Define some color conventions
nsmlt = height(summaryInfoTable); % Number of simulations
colormapName = 'linspecer'; % Color map name
vc.f2.avColors = linspecer(nsmlt); % Set color map for avalanches

% Colors for selected avalanches
vc.f2.avSelColors = 0.5 * [0 0 1; 0 1 0; 1 0 0] + 0.5;
vc.f2.avSelColors(1,:) = [.2 .6 .7];
vc.f2.avSelColors(2,:) = [.3 .9 .4] - 0.15;

% Update colors for selected simulations
for k = 1:numel(selSmltIds)
    vc.f2.avColors(selSmltIds(k), :) = vc.f2.avSelColors(k, :);
end

%% Plot: MSE vs Noise
osx = 0;
osy = 0;

vc.f2.r1yos = 0.04; % row 1 y-offset
vc.f2.r1c1xos = 0.035 % row 1 col 1 x-offset

[~, sbh] = subplot2d(nR,nC, osx+[1 2], osy+[1 2 3]+3);
displaceFigureStuff(sbh, [vc.f2.r1c1xos vc.f2.r1yos  NaN NaN])

vc.f2.kappaYlim = .7;
vc.f2.mseYlim = .02;
vc.f2.mseYtickFlag = [1 1 1];
vc.f2.kappaYtickFlag = [1 1 1];

osxs = [0 2 2*2]
for k = 1 : numel(kselPerc_ids) 
    vc.f2.sbInd = k;
    % kselPercNtr = kselPercNtr_ids(k); % 4
    kselPerc = kselPerc_ids(k); % 6 7  9 10

    % [~, sbh] = subplot2d(nR,nC, osy+[1 2], osxs(k)+[1 2]);    
    % displaceFigureStuff(sbh, [NaN -.03  NaN NaN])
    plot_kappLikeStuff(vc, summaryInfoTable, devMeasure_all, kecn_id, kselPercNtr, kselPerc)
    xlabel('Noise level')
end



for ksav = 1 : numel(selSmltIds) % ksav : k selective avalanche 
        plot_kappLikeStuff(vc, summaryInfoTable, devMeasure_all, kecn_id, kselPercNtr, kselPerc, selSmltIds(ksav))
end

set(gca, 'fontsize', vc.f2.alfs)
% set(gca, 'TickDir', 'out');
% set(gca, 'TickLength', vc.f2.ts);
set_ticksOutward(vc.f2.ts)
box off


%% all avalanches 
vc.f2.r2xos = 0.03
vc.f2.r2yos = 0.01


% [~, sbh] = subplot2d(nR,nC, osx+[1 2 3], osy+[1 2 3]+0);
[~, sbh] = subplot2d(nR,nC, osx+[1 2], osy+[1 2 3]+0);
displaceFigureStuff(sbh, [-vc.f2.r1c1xos vc.f2.r1yos  NaN NaN]);
plot_avRainbow4_wxLeg_dur(vc.f2, avsd, summaryInfoTable, vc.f2.avColors, selSmltIds, 3);
box off
set(gca, 'fontsize', vc.f2.alfs)
xlabel('Avalanche size')
ylim([1e-3 .5])

%% legend
osy = 3;
osx = 4;
[~, sbh] = subplot2d(nR,nC, osy+[1 2], osx+[1 2]);

% plot_avRainbow(vc, avsd, summaryInfoTable, vc.f2.avColors, 3);
lh = plot_avRainbow4(vc.f2, avsd, summaryInfoTable, vc.f2.avColors, selSmltIds, 3);
displaceFigureStuff(lh, [.09 -.02  NaN NaN])
xlim([100 1000])
ylim([100 1000])
box off
axis off
set(gca, 'fontsize', vc.f2.alfs)


%% selected avalanches + demo kappa

osy = 2;
% clf
osxs = [0 2 2*2]
for ksav = 1 : numel(selSmltIds) % ksav : k selective avalanche 
    kselPerc = kselPerc_ids(1); % there is only one
    selSmltId = selSmltIds(ksav);
    [~, sbh] = subplot2d(nR,nC, osy+[1], osxs(ksav)+[1 2]);
    if ksav == 1
        displaceFigureStuff(sbh, [-vc.f2.r2xos -vc.f2.r2yos  NaN NaN])
    elseif ksav == 3
        displaceFigureStuff(sbh, [+vc.f2.r2xos -vc.f2.r2yos  NaN NaN])
    elseif ksav == 2
        displaceFigureStuff(sbh, [NaN -vc.f2.r2yos  NaN NaN])        
    end
    pcof2_act = pcof2_act_all{kecn_id}(kselPercNtr, kselPerc, selSmltId)
    plRefSlop_act = plRefSlop{kecn_id}(kselPercNtr, kselPerc, selSmltId);
    plot_avSel5(vc.f2, avsd, summaryInfoTable, selSmltId, pcof1_act, pcof2_act, plRefSlop_act, ksav)
    ylim([[1e-3 .3]]);
    if any(ksav == 1), ylabel('Probability'); end
    box off
    set_ticksOutward(vc.f2.ts+.02)
    
end

set(gca, 'fontsize', vc.f2.alfs)

%% Note on the remaining panels

% The remaining panels require time consuming computation and/or large files that will be provided upon request (contact research@shervinsafavi.org)
