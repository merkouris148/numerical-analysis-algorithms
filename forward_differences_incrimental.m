function D_out = forward_differences_incrimental(D_in)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	function D_out = forward_differences_incrimental(D_in)
%
%	Input:	D_in,	a forward differences matrix, the secondary
%					diagonial of which is not yet computed
%
%	Output:	D_out,	a forward differences matrix, the secondary
%					diagonial of which is computed
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	n = length(D_in);
	D_out = D_in;
	
	i = n-1; j = 2;
	while (j <= n)
		D_out(i,j) = D_out(i+1, j-1) - D_out(i, j-1);
		i--; j++;
	end
end
