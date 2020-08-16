function X = b_nr(f, g, a, b, err_b, err_nr, Max_it)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
%
%	function X = b_nr(f, g, a, b, err, Max_it)
%
%	Input:	f: 		a function
%			g:		the derivative of f
%			a, b:	a interval s.t. f(a)*f(b) < 0
%			err_b:	the margin of error for the bisection
%			err_nr:	the margin of error for the newton raphson method
%			Max_it:	the maximum number of iterations
%
%	Output:	X:	a vector with the successive estimations x of the
%				solution of the equation f(x) = 0
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	local_inf = 300; % from previous expiriments we know that 300
					% itterations are more than enough
	
	X_b = bisection(f, a, b, err_b, local_inf);
	n = length(X_b);
	printf("Bisection did %d iterations\n", n);
	x_0 = X_b(n);
	X = newton_raphson(f, g, x_0, err_nr, Max_it);
end
