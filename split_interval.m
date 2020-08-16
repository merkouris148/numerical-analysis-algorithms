function [J, h] = split_interval(a, b, n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	function [J, h] = split_interval(a, b, n)
%
%	Input:	[a,b]:	The interval to be splited
%			n:		into n subintervals
%
%	Output:	J:	a row-vector of the endpoints of the subintervals
%			h:	the width of the intervals
%	
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	assert(a < b);
	assert(n > 0);
	
	h = (b - a) / n;
	
	% split interval [a,b] to the intervals:
	%	[a,b] = [a = J(1), J(2)] U [J(2), J(3)] U .. U [J(n-1), J(n) = b]
	J = zeros(1, n+1);
	J(1) = a;
	J(n+1) = b;
	for k = 2:n
		J(k) = J(k-1) + h;
	end
end
