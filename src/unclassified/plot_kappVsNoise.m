function plot_kappVsNoise(vcf, summaryInfoTable_raw, devMeasure_all, kecn, kselPercNtr, kselPerc, singleEcnCol, varargin)

%% handle optional inputs (varargin):
nOpVar=0; % counter for optional variable
nOpVar=nOpVar+1; opVars.sortFlag = []; defaultValues{nOpVar} = 0;
nOpVar=nOpVar+1; opVars.limNoisePlotFlag = []; defaultValues{nOpVar} = 0;

opVars = handleVarargin(varargin, opVars, defaultValues);

%% limited noise plotting
if opVars.limNoisePlotFlag == 1
    opVars.sortFlag = 1
    warning('sortFlag also need to be on')
    summaryInfoTable = sortrows(summaryInfoTable_raw, 'betaVal');
    [~, minMseIndex] = min(summaryInfoTable.mse);
    minNoiseVal = summaryInfoTable.betaVal(minMseIndex);
    noiseBounds = minNoiseVal + minNoiseVal * vcf.percPlotNoise;
    [~, lowerNoiseBound_ind] = min(abs(summaryInfoTable.betaVal - noiseBounds(1)));
    [~, higherNoiseBound_ind] = min(abs(summaryInfoTable.betaVal - noiseBounds(2)));
    % lowerNoiseBound = vcf.percPlotNoise(1);
    % upperNoiseBound = vcf.percPlotNoise(2);
    smltIds = lowerNoiseBound_ind : higherNoiseBound_ind;
else
    nSmlt = height(summaryInfoTable_raw);
    smltIds = 1 : nSmlt;
end


%% sorting
if opVars.sortFlag == 1
    % sort
    [summaryInfoTable, noiseSortInds] = sortrows(summaryInfoTable_raw, 'betaVal');
    % varargout{1} = summaryInfoTable;
    tmp_devMeasure = squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :));
    devMeasure = tmp_devMeasure(noiseSortInds);

else
    summaryInfoTable = summaryInfoTable_raw;
    devMeasure = squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :));
end

% nsmlt = height(summaryInfoTable);

% yyaxis left
% semilogx(tmpSummaryInfoTable.betaVal, devMeasure_all{kecn}, 'b.', 'markersize',vc.ms);
% semilogx(summaryInfoTable.betaVal, squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :)), 'b.', 'markersize',vc.f2.klms);

% *** old dots plot

semilogx(summaryInfoTable.betaVal(smltIds), devMeasure(smltIds), 'color', singleEcnCol, 'linewidth', vcf.lw);

% for k = 1 : nsmlt
%     semilogx(summaryInfoTable.betaVal(k), squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, k)),...
%              '.','color', singleEcnCol , 'markersize',vcf.klms);
%     hold on
% end    


% vcf.ecnColors(k, :)
% **** ???
% [~, minDevIndex] = min(squeeze(devMeasure_all{kecn}(kselPercNtr, kselPerc, :)));
% 
% xline(summaryInfoTable.betaVal(minDevIndex), 'b:');
% ylim([0 vc.f2.kappaYlim])
% if vc.f2.kappaYtickFlag(vc.f2.sbInd) == 1
%     yticks([0 vc.f2.kappaYlim/2 vc.f2.kappaYlim])
%     ylabel('$\kappa$', 'interpreter','latex')
% else
%     yticks([])
% end

% xline(tmpSummaryInfoTable.betaVal(minMseIndex), '--', 'Optimal noise');

% yyaxis right
% ax = gca;
% ax.YColor = 'k'
% % semilogx(summaryInfoTable.betaVal, summaryInfoTable.mse, 'r.', 'markersize',vc.f2.klms-10);
% semilogx(summaryInfoTable.betaVal, summaryInfoTable.mse, 'k');
% [~, minMseIndex] = min(summaryInfoTable.mse);
% xline(summaryInfoTable.betaVal(minMseIndex), 'k--');
% ylim([0 vc.f2.mseYlim])
% % set(gca, yticks, [0 vc.f2.mseYlim/2 vc.f2.mseYlim])
% if vc.f2.mseYtickFlag(vc.f2.sbInd) == 1
%     yticks([0 vc.f2.mseYlim/2 vc.f2.mseYlim])
%     ylabel('MSE')
% else
%     yticks([])
% end
% ax = gca;
% ax.YAxis(2).Exponent = -2;


% % if any(kecn == [3 6 7]), ylabel('MSE'); end
% % if any(kecn == [1 4 7]), ylabel('Mean deviation (a.u.)'); end
