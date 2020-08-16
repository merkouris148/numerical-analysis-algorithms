function X = bisection(f, a, b, err, Max_it)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
%
%	function X = bisection(f, a, b, err, Max_it)
%
%	Input:	f: 		a function
%			a, b:	a interval s.t. f(a)*f(b) < 0
%			err:	the margin of error
%			Max_it:	the maximum number of iterations
%
%	Output:	X:	a vector with the successive estimations x of the
%				solution of the equation f(x) = 0
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	%argument check
	assert(a < b);
	assert(f(a)*f(b) < 0);
	assert(Max_it > 0 && err > 0);
	
	X = zeros(1, Max_it);
	n = 1;
	
	% first two iterrations
	[a, b, X(n)] = bisection_step(f, a, b); n++;
	[a, b, X(n)] = bisection_step(f, a, b); n++;
	
	while(n <= Max_it && abs(X(n-1) - X(n-2)) > err)
		[a, b, X(n)] = bisection_step(f, a, b); n++;
	end
	
	X = X(1:n-1);
	
end


function [a_new, b_new, c_new] = bisection_step(f, a, b)
	c_new = (a + b) / 2;
	
	a_new = a;
	b_new = b;
	
	if (f(a)*f(c_new) < 0)
		b_new = c_new;
	elseif (f(c_new)*f(b) < 0)
		a_new = c_new;
	end
end