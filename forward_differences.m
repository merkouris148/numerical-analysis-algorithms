function D = forward_differences(F)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% The following code has been tested in GNU Octave, version 5.1.0
%
% Author: Merkouris Papamichail, DIT, UOA
% email: sdi1400148@di.uoa.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	[n, _] = size(F);
	
	D = zeros(n, n);
	D(:,1) = F;
	
	for j=2:n+1
		for i=1:n
			if (i+j <= n+1)
				D(i,j) = D(i+1,j-1) - D(i, j-1); 
			end
		end
	end
	
end
