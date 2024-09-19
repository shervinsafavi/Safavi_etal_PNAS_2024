function plot_kappLikeStuff(vc, summaryInfoTable, devMeasure_all, kecn, kselPercNtr, kselPerc, varargin)

%% handle optional inputs (varargin):
nOpVar=0; % counter for optional variable
nOpVar=nOpVar+1; opVars.smltSel = []; defaultValues{nOpVar} = nan;

opVars = handleVarargin(varargin, opVars, defaultValues);


if isnan(opVars.smltSel)
    nsmlt = height(summaryInfoTable);
    selSmlt = 1 : nsmlt
else
    selSmlt = opVars.smltSel;
    vc.f2.klms = vc.f2.klms_wSel;
end

yyaxis left
ax = gca;
ax.YColor = vc.f2.kappaAxisCol;
% semilogx(tmpSummaryInfoTable.betaVal, devMeasure_all{kecn}, 'b.', 'markersize',vc.ms);
% semilogx(summaryInfoTable.betaVal, squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :)), 'b.', 'markersize',vc.f2.klms);

% semilogx(summaryInfoTable.betaVal, squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :)),...
%              'color', vc.f2.kappaAxisCol , 'linewidth', vc.f2.lwMse-1, 'linestyle', '--');
% hold on

if isnan(opVars.smltSel)
    k = 1
    phKappa = semilogx(summaryInfoTable.betaVal(k), squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, k)),...
                       '.','color', 'k', 'markersize',vc.f2.klms);
    hold on
end

for k = selSmlt
    semilogx(summaryInfoTable.betaVal(k), squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, k)),...
             '.','color', vc.f2.avColors(k, :), 'markersize',vc.f2.klms);
    hold on
end    
[~, minDevIndex] = min(squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :)));
% xline(summaryInfoTable.betaVal(minDevIndex), 'b:');
phMinKapa = xline(summaryInfoTable.betaVal(minDevIndex), '-', 'color', vc.f2.kappaVerLin, 'linewidth',1.5, 'label','Min \kappa');
phMinKapa.LabelVerticalAlignment = 'middle';
phMinKapa.LabelHorizontalAlignment = 'left';
% phMinKapa.LabelHorizontalAlignment = 'center';
ylim([0 vc.f2.kappaYlim])
if vc.f2.kappaYtickFlag(vc.f2.sbInd) == 1
    yticks([0 vc.f2.kappaYlim/2 vc.f2.kappaYlim])
    ylabel('$\kappa$', 'interpreter','latex')
else
    yticks([])
end

% xline(tmpSummaryInfoTable.betaVal(minMseIndex), '--', 'Optimal noise');

yyaxis right
ax = gca;
% ax.YColor = vc.f2.mseCol;
ax.YColor = vc.f2.mseColAxStuff;
% semilogx(summaryInfoTable.betaVal, summaryInfoTable.mse, 'r.', 'markersize',vc.f2.klms-10);
phMse = semilogx(summaryInfoTable.betaVal, summaryInfoTable.mse, 'color', vc.f2.mseCol, 'linewidth', vc.f2.lwMse, 'linestyle', ':');
[~, minMseIndex] = min(summaryInfoTable.mse);
% xline(summaryInfoTable.betaVal(minMseIndex), 'k--');
% xline(summaryInfoTable.betaVal(minMseIndex), ':', 'color', vc.f2.mseCol, 'linewidth', 1);
phMinMse = xline(summaryInfoTable.betaVal(minMseIndex), '--', 'color', vc.f2.mseColVerLin, 'linewidth', 1.5, 'label', 'Min MSE');
phMinMse.LabelVerticalAlignment = 'middle';
% phMinMse.LabelHorizontalAlignment = 'left';
ylim([0 vc.f2.mseYlim])
% set(gca, yticks, [0 vc.f2.mseYlim/2 vc.f2.mseYlim])
if vc.f2.mseYtickFlag(vc.f2.sbInd) == 1
    yticks([0 vc.f2.mseYlim/2 vc.f2.mseYlim])
    ylabel('MSE')
else
    yticks([])
end
ax = gca;
ax.YAxis(2).Exponent = -2;

if isnan(opVars.smltSel)
    [lh, icons] = legend(gca, [phKappa phMse], '\kappa vs. noise', 'MSE vs. noise', 'NorthWest');
    set(lh, 'box', 'off')
    % displaceFigureStuff(lh, [+.03 .02 NaN NaN])
    displaceFigureStuff(lh, [+.04 .02 NaN NaN])

    % for the gray line in the legend
    % bof = 0.1; % backward offset
    bof = 0.15; % backward offset
    for k = 5
        tmpOrigPos = icons(k).XData(2);
        icons(k).XData(2) = tmpOrigPos - bof; 
    end
    
    % for the dots in the legend
    for k = 4
        % tmpOrigPos = icons(k).XData(2);
        icons(k).XData(1) = .12
    end
    % bof = 0.35; % backward offset
    % for k = 3
    %     tmpOrigPos = icons(k).XData(2);
    %     icons(k).XData(2) = tmpOrigPos - bof; 
    % end

    for k = 2
        % icons(k).Position(1) = 0.3;
        icons(k).Position(1) = 0.25;
    end
    
    % change the position of kappa vs MSE text
    for k = 1
        icons(k).Position(1) = 0.36;
    end
    
end

% if any(kecn == [3 6 7]), ylabel('MSE'); end
% if any(kecn == [1 4 7]), ylabel('Mean deviation (a.u.)'); end