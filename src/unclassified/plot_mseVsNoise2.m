function varargout = plot_mseVsNoise2(vcf, summaryInfoTable_raw, kecn, varargin)
% plot_mseVsNoise(vc, summaryInfoTable, avColors, sortFlag)

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
    summaryInfoTable = sortrows(summaryInfoTable_raw, 'betaVal');
    varargout{1} = summaryInfoTable;
else
    summaryInfoTable = summaryInfoTable_raw;
end



%% plot
% avColors = cool(nsmlt);

semilogx(summaryInfoTable.betaVal(smltIds), summaryInfoTable.mse(smltIds), 'color', vcf.ecnColors(kecn, :), 'linewidth', vcf.lw);
hold all
% for k = 1 : nsmlt
%     semilogx(summaryInfoTable.betaVal(k), summaryInfoTable.mse(k), '.', ...
%              'color','k', 'markersize', 17)
%     hold on
% end

% vc.f2.avColors(k, :)

ax = gca;
ax.YAxis.Exponent = -3;

ylabel('MSE')
xlabel('Noise level');
set(gca, 'fontsize', vcf.alfs)

end

