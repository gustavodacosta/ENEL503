function [CV] = CharacteristicValues(Im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

X = 500; Y = X;
CV = zeros(1,length(Im));
Imk = zeros(X,Y);
for k = 1:length(Im)
    Imk = Im(1,k).image;
    Sum = 0;
    for i = 1:X
        for j = 1:Y
            Sum = Sum + double(Imk(i,j));
        end
        CV(k) = Sum/(255*X*Y);
    end
end

end