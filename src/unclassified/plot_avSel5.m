function varargout = plot_avSel5(vcf, avsd, summaryInfoTable, selSmltId, pcof1_act, pcof2_act, plRefSlop_act, id4col)
% similar to plot_avSel4, but with plot_avDis...2

% nsmlt = height(summaryInfoTable);

% for ksai = selSmltId
% ksai = k av id    
% ksa = k av    
for ksa = 1 : numel(selSmltId)

    ksai = selSmltId(ksa);
    [probVal, avSizeVal] = plot_avDistribution2(avsd{ksai}, 1, 'linewidth',vcf.alws, 'color', vcf.avSelColors(id4col, :), 'linestyle', ':');
    hold on 
    
    % [probVal, avSizeVal] = plot_avSel(vc, avsd, summaryInfoTable, selSmltId);
    tmpInds = find(avSizeVal >= pcof1_act & ...
                   avSizeVal <= pcof2_act)
    xVals = avSizeVal(tmpInds)
    plExp = plRefSlop_act;
    yVals = xVals .^ plExp;

    y0val = probVal(pcof1_act) / (pcof1_act ^ plExp);
    % loglog(xVals,  yVals * y0val);
    % hold all
    xline(pcof1_act, 'linestyle', '-');
    % hold on
    xline(pcof2_act, 'linestyle', '-');
    chx2 = [xVals, fliplr(xVals)];
    inBetween = [yVals*y0val, fliplr(probVal(tmpInds))];
    fill(chx2, inBetween, vcf.kappaFillCol);
    
    [probVal, avSizeVal] = plot_avDistribution2(avsd{ksai}, 1, 'linewidth',vcf.alws, 'color', vcf.avSelColors(id4col, :), 'linestyle', ':');
    % yticks(vcf.avProbLim)
    yticks([vcf.avProbLim(1) 1e-3 vcf.avProbLim(2)])
end


% ylim([1e-7 1e-1])
ylim(vcf.avProbLim)
xlim(vcf.avSizeLim_b)
% grid on
% pbaspect([1 1 1])

xlabel('Avalanche size')
% ylabel('Probability')

set(gca, 'fontsize', vcf.alfs)

varargout{1} = probVal;
varargout{2} = avSizeVal;
end

