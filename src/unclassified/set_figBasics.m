function set_figBasics(varargin)
% set_figSize(vc)
% vc = visual conventions
% vc should have the vollowing fileds
% vc.w;
% vc.h;

if nargin == 1
    vc = varargin{1}
end


fh = gcf;
% % 
fh.Color        = [1 1 1];
fh.Units        = 'centimeters';
fh.Position(3)  = vc.w;
fh.Position(4)  = vc.h;
% 
% mmlw = 1; % min MSE line width
% nR = vc.nR;
% nC = vc.nC;
