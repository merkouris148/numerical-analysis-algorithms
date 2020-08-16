function X = newton_raphson(f, g, x_0, err, Max_it)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
%
%	function X = newton_raphson(f, g err, Max_it)
%
%	Input:	f: 		a function
%			g:		the derivative of f
%			x_0:	the initial estimation of the solution
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
	assert(Max_it > 0 && err > 0);
	
	X = zeros(1, Max_it);
	n = 1;
	
	% first two iterrations
	X(n) = newton_raphson_step(f, g, x_0); n++;
	X(n) = newton_raphson_step(f, g, X(n-1)); n++;
	
	while(n <= Max_it && abs(X(n-1) - X(n-2)) > err)
		X(n) = newton_raphson_step(f, g, X(n-1)); n++;
	end
	
	X = X(1:n-1);
	
end


function x_new = newton_raphson_step(f, g, x_old)
	assert(g(x_old) != 0);	
	
	x_new = x_old - f(x_old)/g(x_old);
end
