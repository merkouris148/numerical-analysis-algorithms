function A_inv = gaussian_inv(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
%
%	function A_inv = gaussian_inv(A)
%
%	Input:	A, 		a square matrix
%
%	Ouput:	A_inv,	the inverse of A
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	[r, c] = size(A); assert(r == c);
	n = r; % = c

	C = gauss_partial_pivoting([A eye(n)]);
	A_inv = gaussian_solve(C(:, 1:n), C(:, n+1:2*n));
end
