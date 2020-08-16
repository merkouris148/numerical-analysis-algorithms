function I = simpsons_integral(f, n, a, b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	Input:	f:		the function to be integrated.
%			n:		the number of intervals.
%			[a,b]	the interval of integration.
%
%	Output:	I:	the estimation of the integral from a to b S f(x) dx. 
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[J, h] = split_interval(a, b, n);
	
	I = 0;
	for k = 1:2:n-1
		I = I + simpsons_rule(f, h, J(k), J(k+1), J(k+2));
	end
end

function I = simpsons_rule(f, h, a, b, c)
	I = (h/3)*(f(a) + 4*f(b) + f(c));
end
