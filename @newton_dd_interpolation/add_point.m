function nddi_out = add_point(nddi_in, x, f)
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
	
	nddi_out = nddi_in;
	nD = length(nddi_in.D);
	nddi_out.D = [nddi_out.D; zeros(1, nD)];	% add a row
	nddi_out.D = [nddi_out.D zeros(nD + 1, 1)];	% add a column
	
	nddi_out.D(nD+1, 1) = f;	% finally, add the new point f
	
	nddi_out.X = [nddi_out.X; x]; % also, add the x-point
	
	nddi_out.D = divided_differences_incrimental(nddi_out.X, nddi_out.D);
end
