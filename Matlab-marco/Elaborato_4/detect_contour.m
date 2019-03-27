
Im = imread('forme.jpg');
image(Im);
[x, y] = ginput;

n= length(x);
x = fliplr(x);
y = fliplr(y);

s = (1:n)';
tt = (1:1/8:n)';

u = spline(s,x,tt);
v = spline(s,y,tt);

plot(x,y,'bo',u,v,'g-')
set(gca,'YDir','reverse');

