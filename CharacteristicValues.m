function [Sim] = CharacteristicValues(Im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

X = 500; Y = X;
Sim = zeros(1,length(Im));
Imk = zeros(X,Y);
for k = 1:6
    Imk = Im(1,k).image;
    Sum = 0;
    for i = 1:X
        for j = 1:Y
            Sum = Sum + abs(double(Im(1,1).image(i,j)) - double(Imk(i,j)));
        end
        Sim(k) = 1 - Sum/(255*X*Y);
    end
end

end