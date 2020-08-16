function y = estimate(nfdi, x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	Input:	nfdi,	A Newton Forward Differences Interpolation object
%			x,		a point, x in IR
%
%	Output:	y,	the estimation of y = f(x)
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	n = length(nfdi.D);
	
	Theta = zeros(1, n);
	Theta(1) = 1;
	Theta(2) = (x - nfdi.x0) / nfdi.h;
	for i = 3:n
		Theta(i) = Theta(i-1) * ( (Theta(i-1) - 1) / i );
	end	
	
	y = nfdi.D(1, :) * Theta';

end
