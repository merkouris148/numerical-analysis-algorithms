function nddi = newton_dd_interpolation(X, F)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	function nfdi = newton_dd_interpolation(X, F)
%
%	The constructor of the Newton Forward Differences Interpolation
%	class.
%
%	Input:	X, 	the initial points
%			F,	the values of the function f, at the points of X
%
%	Output:	nddi,	the Newton Divided Differences Interpolation
%					class.
%
%	Data Members:	D,	the matrix of the divided differences, the
%						1st colum of D is F
%					X,	the initial points
%
%	Methods:	add_point(f),	adds a new point to F, and
%								recalculating D
%				estimate(x),	estiates the value f(x)
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	nddi.D = divided_differences(X, F);
	nddi.X = X;
	
	nddi = class(nddi, "newton_dd_interpolation");
end
