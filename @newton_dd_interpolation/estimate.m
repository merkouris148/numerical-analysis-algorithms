function y = estimate(nddi, x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	Input:	nddi,	A Newton Divided Differences Interpolation object
%			x,		a point, x in IR
%
%	Output:	y,	the estimation of y = f(x)
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	n = length(nddi.D);
	
	Theta = zeros(1, n);
	Theta(1) = 1;
	for i = 2:n
		Theta(i) = Theta(i-1) * (x - nddi.X(i-1));
	end	
	
	y = nddi.D(1, :) * Theta';

end
