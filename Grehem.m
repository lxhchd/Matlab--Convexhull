function [ind] = Grehem(x0, y0)
[x ix] = sort(x0);
s = size(x);
l = 1;
index1 = 0;
yc = y0(ix);
for i = 1 : s(2)
    for j = i + 1 : s(2)
    if ((x(i) == x(j)) && (yc(i) == yc(j))) 
        index1(l) = j;
        l = l + 1;
    end
    end
end
if (l > 1)
    x(index1) = [];
    ix(index1) = [];
end
y = y0(ix);
s = size(x);
st = 1;
i = 1;
N = s(2);
f = 1;
y = y0(ix);
while (i <= N)
    in = zeros(N);
    k = 0;
    i0 = i;
    while ((i <= N) && (x(i) == x(st)))
        k = k + 1;
        in(k) = i;
        i = i + 1;
    end 
    st = i;
    [y1 iy]  = sort(y(in(in > 0)), 'descend');
    iy = iy + i0 - 1;
    if (f == 1) 
        Y = y1;
        f = 0;
        IY = iy;
    else
        Y = cat(2, Y, y1);
        IY = cat(2, IY, iy);
    end
end
y = Y;
iy = ix(IY);
x0(iy);
A_x = x(1);
A_y = y(1);
B_x = x(N);
B_y = y(N);
k = (A_y - B_y) / (A_x - B_x);
b = k * (-B_x) + B_y;
h_pntr = 1;
l_pntr = 1;
h_stack(1) = iy(1);
l_stack(1) = iy(1);
j = 0;
for i = 2 : N
    if ((y(i) >= k * x(i) + b) || (i == N))
        if (h_pntr == 1)
            h_pntr = 2;
            h_stack(2) = iy(i);
        else
            if (square(x0(h_stack(h_pntr - 1)), y0(h_stack(h_pntr - 1)), x0(h_stack(h_pntr)), y0(h_stack(h_pntr)), x(i), y(i)) <= 0)
                h_pntr = h_pntr + 1;
                h_stack(h_pntr) = iy(i);
            else
                h_stack(h_pntr) = iy(i);

                f = h_pntr;
                for j = f : -1 : 3
                    if (square(x0(h_stack(j - 2)), y0(h_stack(j - 2)), x0(h_stack(j - 1)), y0(h_stack(j - 1)), x0(h_stack(j)), y0(h_stack(j))) > 0)
                     
                        h_pntr = h_pntr - 1;
                        h_stack(h_pntr) = iy(i);
                    end
                end
                
            end
        end
    end
    if ((y(i) < k * x(i) + b) || (i == N)) 
        if (l_pntr == 1)
            l_pntr = 2;
            l_stack(2) = iy(i);
         else
            if (square(x0(l_stack(l_pntr - 1)), y0(l_stack(l_pntr - 1)), x0(l_stack(l_pntr)), y0(l_stack(l_pntr)), x(i), y(i)) >= 0)
                l_pntr = l_pntr + 1;
            
                l_stack(l_pntr) = iy(i);
            else
                l_stack(l_pntr) = iy(i);
                f = l_pntr;
                for j = f : -1 : 3
                    if (square(x0(l_stack(j - 2)), y0(l_stack(j - 2)), x0(l_stack(j - 1)), y0(l_stack(j - 1)), x0(l_stack(j)), y0(l_stack(j))) < 0)
                        l_pntr = l_pntr - 1;
                        l_stack(l_pntr) = iy(i);
                    end
                end
                
            end
        end
    end
end
    l_stack(1 : l_pntr);
    h_stack(h_pntr - 1 : -1 : 2);
    ind = cat(2, l_stack(1 : l_pntr), h_stack(h_pntr - 1 :-1: 1));
end
    