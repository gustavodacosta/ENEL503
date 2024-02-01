function [Sim] = SimilarityDetermination(Im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

X = 500; Y = X;
Sim = zeros(length(Im),length(Im));
Imk = zeros(X,Y);
for k = 1:length(Im)
    for l = 1:length(Im)
        Imk = Im(1,k).image;
        Sum = 0;
        for i = 1:X
            for j = 1:Y
                Sum = Sum + abs(double(Im(1,l).image(i,j)) - double(Imk(i,j)));
            end
            Sim(k, l) = 1 - Sum/(255*X*Y);
        end
    end
end

end