function varargout = plot_avDistribution(avData, varargin) 
% [probabilities, avMult] = plot_avDistribution(avData) 

if nargin > 1
    plotFlag = varargin{1};
else
   plotFlag = 1; 
end

c = unique(avData);
y = zeros(size(c));

for i = 1:length(c)
    y(i) = sum(avData == c(i)) / sum(avData);
end

if plotFlag == 1
    loglog(c, y,  varargin{2:end});
end
varargout{1} = y;
varargout{2} = c;