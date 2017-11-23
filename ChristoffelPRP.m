function ChristMatrix = ChristoffelPRP(D, q, qDot)
% return a matrix of the Christoffel symbols
%
% I need to pass this matrix the symbolic representation of the D(q) matrix
%
% also I'll just multiply the qDot vectors here too
%
% Function returns the C(qdot) matrix

for k = 1:3
    for j = 1:3
        for i = 1:3
            
            C_temp(i,j,k) = 0.5*(diff(D(k,j),q(i)) + diff(D(k,i),q(j)) - diff(D(i,j),q(k)));
            
        end
    end
end

% Now I have a 3D matrix I need to split bc the lagrange equaltions are 2D
ChristMatrix(:,1) = C_temp(:,:,1)*qDot;
ChristMatrix(:,2) = C_temp(:,:,2)*qDot;
ChristMatrix(:,3) = C_temp(:,:,3)*qDot;


end