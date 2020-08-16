function X = gaussian_solve(A, B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
% returns the solution of a linear system of the form A*X = B 
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	rb = rows(B);
	cb = columns(B);
	ca = columns(A);
	
	X = zeros(rb, cb);
	for i = 1:cb
		for j = rb:-1:1
			X(j, i) = ( B(j, i) - A( j, (j+1) : ca ) * X( (j+1) : ca, i ) ) / A(j, j);
		end
	end
end 
