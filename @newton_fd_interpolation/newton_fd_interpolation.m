function nfdi = newton_fd_interpolation(x0, h, F)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
%	function nfdi = newton_fd_interpolation(x0, h, F)
%
%	The constructor of the Newton Forward Differences Interpolation
%	class.
%
%	Input:	x0, in IR The initial point
%			h,	the distances between the points
%			F,	the values of the function f, at the points of the
%				form x0 + i*h, for some i in IN
%
%	Output:	nfdi,	the Newton Forward Differences Interpolation
%					class.
%
%	Data Members:	D,	the matrix of the differences, the 1st colum
%						of D is F
%					x0,	the initial point
%					h,	points distance
%
%	Methods:	add_point(f),	adds a new point to F, and
%								recalculating D
%				estimate(x),	estiates the value f(x)
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	nfdi.D = forward_differences(F);
	nfdi.x0 = x0;
	nfdi.h = h;
	
	nfdi = class(nfdi, "newton_fd_interpolation");
end
