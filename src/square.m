function y = square(x1, y1, x2, y2, x3, y3)
y = 0.5 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2));