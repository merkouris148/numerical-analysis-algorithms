function r = spectral_radius(l)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following code has been tested in GNU Octave, version 4.2.2
% Input: 	A vector l of the eigenvalues of a matrix
% Output:	The spectral radius of the matrix, that is the eigenvalue
%			with the maximum absolute value
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	n = length(l);
	r = -1;
	for i = 1:n
		if (abs(l(i)) > r)
			r = abs(l(i));
		end
	end
end

