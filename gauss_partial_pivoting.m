function B = gauss_partial_pivoting(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 4.2.2
% computes the sequence o matrices A = A0, A1, A2, .., An = B where
%  B is an upper triangular matrix.
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	n = rows(A);
	h = zeros(1, n);
	for i = 1:n
		h(i) = i;
	end
	
	for i = 1:(n-1)
		[A, h] = elimination_step(A, h, i);
		disp(A)
		disp(h)
	end
	
	for i = 1:n
		B(i, :) = A(h(i), :);
	end
end


function [B, g] = elimination_step(A, h, r)
% runs a step of gauss elimination with partial pivoting
	n = rows(A);
	c = columns(A);
	
	% find pivoting element
	max_val = -inf;
	p = r;
	for j = r:n
		if (A(h(j), r) > max_val)
			max_val = A(h(j), r);
			p = j;
		end
	end
	
	% change the rows
	temp = h(r);
	h(r) = h(p);
	h(p) = temp;
	

	for i = (r+1):n
		m = - A(h(i), r) / A(h(r), r);
		A(h(i), :) = A(h(i), :) + m*A(h(r), :);
		% for j = r:c
		%	A(h(i), j) = A(h(i), j) + m*A(h(r), j);		
		% end
	end
	
	B = A;
	g = h;
end
	
		
