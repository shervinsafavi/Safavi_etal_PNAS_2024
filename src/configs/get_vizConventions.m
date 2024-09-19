function vc = get_vizConventions()
% get_vizConventions()
% this function give the parameters are needed only in visualization (visualization conventions)

%% general settings
vc.ecnSize_all = [50 76 100 126 150 176 200 300 400];
vc.f2.kecn_id = 3; % network of 100
% vc.f3.sel_ecn_ids = [1 2 3 5 6 7 8];
% this include 176
% vc.f3.sel_ecn_ids = [1 2 3 5 6 7 8 9];
% does not include 176

%% figure 2
% layout
%  1 1 1 | 1 1 1
% 1
% 1
% 1
% --
% 1
% 1
% --
% 1
% 1

vc.f2.nR = 7;
vc.f2.nC = 6;

vc.f2.w = 11.4
vc.f2.h = vc.f2.w * vc.f2.nR/vc.f2.nC;

vc.f2.alfs = 08;
vc.f2.alw = 1;
vc.f2.alws = 2; % alws: avalanches line width for selected [avalanche]
vc.f2.lwMse = vc.f2.alws; % lwMse: line width for MSE [curve]


vc.f2.klms = 14; % klms: kappa-like marker size
vc.f2.klms_wSel = 22; % klms: kappa-like marker size - for selected simulation IDs

vc.f2.sblfs = vc.f2.alfs  + 1;
vc.f2.sblbf = 1; % sblbf : subplot label bold flag

% vc.f2.kappaFillCol = [.5 1 .2]; 
vc.f2.mseCol = .6 * ones(1, 3);
% vc.f2.kappaFillCol = .75 * ones(1,3); 
vc.f2.kappaFillCol = .85 * ones(1,3); 
% 
vc.f2.mseColAxStuff = .6 * [0 1 1];
vc.f2.kappaAxisCol = .6 * [1 0 1]; 
tmpColScale = .8;
vc.f2.mseColVerLin = tmpColScale * [0 1 1];
vc.f2.kappaVerLin = tmpColScale * [1 0 1]; 

% y-axis lim of B
% vc.f2.avProbLim = [1e-6 1e-1]

vc.f2.avProbLim = [1e-5 1e-1];
vc.f2.avProbLim_a = [1e-7 1e-1];
vc.f2.avSizeLim_b = [0 100];
% vc.f2.ts =  [0.025 0.025]; % ts: tick size
vc.f2.ts =  0.025; % ts: tick size                           % 


%% figure 3
vc.f3.sel_ecn_ids = [1 2 3 5  7 8 9];
vc.f3.maxNoiseVal4diagPlot = 5;
% vc.f3.xtick = [.5 1 2.5 5];
vc.f3.xtick = [1 5];

vc.f3.lw = 1.5;
vc.f3.alfs = vc.f2.alfs;
vc.f3.klms = vc.f2.klms;
% vc.f1.mc = [.5 0 .5]

%% figure 2
% vc.f2.w = 19.4235;
% vc.f2.h = 24.4608;
% vc.f2.nR = 1+2+1+3+1;
% vc.f2.nC = 2+2;
% % hfi : half figure index
% vc.f2.hfi = (vc.f2.nC) / 2;
% vc.f2.tlw = 2.8;         % trace line width
% % specify the location of an extra axis 
% tyLoc = .05
% vc.f2.r4pos = [ ...
%     0.13 tyLoc 0.156648936170213 0.0760103626943005; ...
%     0.336117021276596 tyLoc 0.156648936170213 0.0760103626943005; ...
%     0.542234042553192 tyLoc 0.156648936170213 0.0760103626943005; ...
%     0.748351063829787 tyLoc 0.156648936170213 0.0760103626943005];
% vc.f2.r3pos = [0.13 0.240569948186528 0.775 0.287150259067357];
% vc.f2.fsi = 10;          % font size inset
% vc.f2.ncc = [1 .65 0];   % no coupling color
% vc.f2.wcc = [.7 0 .7];   % with coupling color
% vc.f2.ll = 0.682;        % legend loc
% vc.f2.imts = 0.05;       % 
% vc.f2.fsm = 12;          % font size main

% %% figure 3
% vc.f3.w = 16.3072;
% vc.f3.h = 8.2176;
% vc.f3.nR = 2;
% vc.f3.nC = 3;

% %% figure 5
% vc.f5.h = 13.2176;
% vc.f5.w = 16.3072;

% vc.f5.nR = 3;
% vc.f5.nC = 2;

% vc.f5.lw = 2;

% xoffserCol2 = 0.797;
% vc.f5.axisLoc{2} = [...
%     xoffserCol2, .8148 .15 .1; ...
%     xoffserCol2, .5248 .15 .1; ...
%     xoffserCol2, .2262 .15 .1];
% vc.f5.xlimSel = [...
%     15 20; ...
%     5 8; ...
%     3 6]
% xoffserCol1 = 0.307;
% vc.f5.axisLoc{1} = [...
%     xoffserCol1, .8248 .15 .1; ...
%     xoffserCol1, .5248 .15 .1; ...
%     xoffserCol1, .2262 .15 .1];

end

