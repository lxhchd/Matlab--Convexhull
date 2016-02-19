%% CONVEXHULL
%write to file numbers with a different distribution.
name = '1.mat';
write2file(name);
fid = fopen(name, 'rb');    
if fid == -1                 
    error('File is not opened'); 
end
%there is an animation of graphics, which shows convex hull of
%numbers with the same distribution. Quantity changes.
quantity = 3;
for j = 1 : quantity
    N = fread(fid, 1, 'double');
    N = N * N;
    x = fread(fid, N, 'double')';
    y = fread(fid, N, 'double')';
    tic();
    main(x, y);
    l1 = toc();
    tic();
    convhull(x, y);
    l2 = toc();
    po(j) = l2;
    pp(j) = l1;
    hold off
end

plot(n, pp)
hold on
plot(n, po)
legend('MyFunc', 'convhull');
xlabel('N = number of elements');
ylabel('time of work');
print('g1', '-dpng');
fclose(fid); 