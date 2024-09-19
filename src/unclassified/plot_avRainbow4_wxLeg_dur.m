function plot_avRainbow4_wxLeg_dur(vcf, avsd, summaryInfoTable, avColors, selSmltIds, varargin)
% in plot_avRainbow4_wxLeg_dur
% also plot_avDistribution2 is used
% plot_avRainbow4, plot_avDistribution was mistakeny used
%% handle optional inputs (varargin):
nOpVar=0; % counter for optional variable
nOpVar=nOpVar+1; opVars.avIndInterval = []; defaultValues{nOpVar} = 1;

opVars = handleVarargin(varargin, opVars, defaultValues);

%%
nsmlt = height(summaryInfoTable);

for ksai = 1 : opVars.avIndInterval : nsmlt
    if any(ksai == selSmltIds)
        tmpLw = vcf.alws;
    else
        tmpLw = vcf.alw;
    end
    plot_avDistribution2(avsd{ksai}, 1, 'linewidth',tmpLw, 'color', avColors(ksai, :));
    hold on 
end



% ylim([1e-7 1e-1])
ylim(vcf.avProbLim)
% yticks(vcf.avProbLim)
yticks([vcf.avProbLim(1) 1e-3 vcf.avProbLim(2)])
% grid on
% pbaspect([1 1 1])

xlabel('Avalanche duration')
ylabel('Probability')

set(gca, 'fontsize', vcf.alfs)
set_ticksOutward(vcf.ts)

%%
% [lh] = legend(num2str(summaryInfoTable.betaVal(1 : opVars.avIndInterval : nsmlt), '%.1f'), 'location', 'southwest', 'NumColumns',2);
% [lh, icons] = legend(num2str(summaryInfoTable.betaVal(selSmltIds), '%.1f'), 'location', 'southwest');
% set(lh, 'box', 'off')
% lh.ItemTokenSize = [12 18];
% title(lh, 'Noise level [a.u.]', 'fontweight', 'normal')

% displaceFigureStuff(lh, [-.012 -.022 NaN NaN])

% shorten the legend line
% https://de.mathworks.com/matlabcentral/answers/95161-how-can-i-modify-the-lengh-of-the-lines-in-a-legend

% bof = 0.44; % backward offset
% for k = 11 : 2 :length(icons)
%     tmpOrigPos = icons(k).XData(2);
%     icons(k).XData(2) = tmpOrigPos - bof; 
% end

% for k = 1 : 10
%     icons(k).Position(1) = 0.3;
% end


end

