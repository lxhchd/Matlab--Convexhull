function write2file(text)
fid = fopen(text, 'wb');
N = 3;
[X, Y] = meshgrid(1 : N,1 : N); 

x = X(:);
y = Y(:);
size(x)
fwrite(fid, N, 'double');
fwrite(fid, x, 'double');
fwrite(fid, y, 'double');

N = 10;
[X, Y] = meshgrid(1 : N,1 : N); 

x = X(:);
y = Y(:);
fwrite(fid, N, 'double');
fwrite(fid, x, 'double');
fwrite(fid, y, 'double');

N = 30;
[X, Y] = meshgrid(1 : N,1 : N); 

x = X(:);
y = Y(:);
fwrite(fid, N, 'double');
fwrite(fid, x, 'double');
fwrite(fid, y, 'double');

N = 60;
[X, Y] = meshgrid(1:N,1 :N); 

x = X(:);
y = Y(:);
fwrite(fid, N, 'double');
fwrite(fid, x, 'double');
fwrite(fid, y, 'double');

