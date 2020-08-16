function [l, x, n_it] = power_iteration(A, x_0, max_it, err, m = 'm')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
%
%	function [l, x, n_it] = power_iteration(A, x_0, max_it, err, m = 'm')
%
%	Input:	A, 		a matrix
%			x_0,	the initial vector
%			max_it,	# of max iterations
%			err,	the margin of error
%			m,		m (mode) is a string, where m == 'm' (modified) or
%					m == 'r' (rayleigh),
%					m == 'a' (aitiken)
%					by default m == 'm'
%
%	Ouput:	l,		the estimated eigen value
%			x,		the coresponding eigen vector
%			n_it,	number of iterations
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	assert(m == 'm' || m == 'r'|| m == 'a');
	if(m == 'm')
		power_iteration_step = @modified_step;
	elseif(m == 'r')
		power_iteration_step = @rayleigh_step;
	else
		power_iteration_step = @aitiken_step;
	end
	
	assert(max_it > 0 && err > 0);
	
	% the first two steps
	n = 0;
	[l_o, x_o] = power_iteration_step(A, x_0, 0); n++; 
	[l_n, x_n] = power_iteration_step(A, x_o, l_o); n++;
	
	while(n <= max_it && abs(l_n - l_o) >= err)
		l_o = l_n;
		x_o = x_n;
		
		[l_n, x_n] = power_iteration_step(A, x_o, l_o);
		
		n++;
	end
	
	% return the number of iterations made
	l = l_n;
	x = x_n;
	n_it = n - 1;
end


function [l_n, x_n] = modified_step(A, x_o, _)
	% normalize	
	x_o = (1/norm(x_o, inf)) * x_o;
	
	% caclulate new eigen vector
	x_n = (A * x_o')';				% we need x_n to be row vector
	
	% calculate new eigen value
	[_, j_0] = max(abs(x_n));		% arg max
	l_n = x_n(j_0(1));
end



function [l_n, x_n] = rayleigh_step(A, x_o, _)
	% normalize old eigen vector
	x_o = (1/norm(x_o)) * x_o;
	
	% calculate new eigen vector
	x_n = (A * x_o')';				% we need x_n to be row vector
	
	# calculate new eigen value
	l_n = x_n * x_o';
end


function [l_n, x_n] = aitiken_step(A, x_1, l_1)
	[l_2, x_2] = modified_step(A, x_1, l_1);
	[l_3, x_3] = modified_step(A, x_2, l_2);
	
	if(l_3 - 2*l_2 + l_1 != 0)
		l_n = l_1 - ( (l_2 - l_1)^2 / (l_3 - 2*l_2 + l_1) );
	else
		l_n = l_3;
	end	
	x_n = x_3;
end



	
	
	
	
