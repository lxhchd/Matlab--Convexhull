function main(x, y)
plot(x, y, 'g*');
hold on
k1 = convexHull(x, y);
plot(x(k1), y(k1), 'r*');
print('4', '-dpng');
end
%%if (sort(k1) == sort(k')) 
%%    'YES'
%%else
 %%   'NO'
%%end