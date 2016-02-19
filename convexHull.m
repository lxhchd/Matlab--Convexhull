function [ind] = convexHull(x, y)
s1 = size(x);
s2 = size(y);
if (s1(2) ~= s2(2)) 
    error('ERROR')
end
N0 = 110;
s = size(x);
N = s(2);
if (N <= N0)

        ind = Grehem(x, y);
            
else
    N1 = fix(N /2);
    x1 = x(1 : N1);
    x2 = x(N1 + 1 : N);
    y1 = y(1 : N1);
    y2 = y(N1 + 1 : N);
    ind1 = convexHull(x1, y1);
    ind2 = convexHull(x2, y2);
    ind2 = ind2 + N1;
    ind3 = cat(2, ind1, ind2);
    s = size(ind3);
    if (s(2) > 3) 
        ind30 = Grehem(x(ind3), y(ind3));
        ind = ind3(ind30);
    else
        ind = ind3;
    end
end
end
    