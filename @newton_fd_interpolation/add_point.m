function nfdi_out = add_point(nfdi_in, f)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	function nfdi_out = add_point(nfdi_in, f)
%
%	Input:	nfdi_in,	an object of the class Newton Forward
%						Differences Interpolation
%			f,			a new value of the function f
%
%	Output:	nfdi_out,	a new object of the class Newton Forward
%						Differences Interpolation
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	nfdi_out = nfdi_in;
	nD = length(nfdi_in.D);
	nfdi_out.D = [nfdi_out.D; zeros(1, nD)];	% add a row
	nfdi_out.D = [nfdi_out.D zeros(nD + 1, 1)];	% add a column
	
	nfdi_out.D(nD+1, 1) = f;	% finally, add the new point
	
	nfdi_out.D = forward_differences_incrimental(nfdi_out.D);
end
