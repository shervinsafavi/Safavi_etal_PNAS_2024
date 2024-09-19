function varargout = plot_avDistribution2(avData, varargin) 
% similar to plot_avDistribution, but corrected
% [probabilities, avMult] = plot_avDistribution(avData) 

if nargin > 1
    plotFlag = varargin{1};
else
   plotFlag = 1; 
end

c = unique(avData);
y = zeros(size(c));

for i = 1:length(c)
    y(i) = sum(avData == c(i)) / numel(avData);
end

if plotFlag == 1
    loglog(c, y,  varargin{2:end})
end
varargout{1} = y;
varargout{2} = c;
