Im = imread('prova.png');
I = imresize(Im, [64 NaN]);
[r,c,v] = size(I);
x = 1:c; y = 1:r;
NEW_I = zeros(5*r,5*c,v,'uint8');
NEW_I_L = zeros(5*r,5*c,v,'uint8');
new_x = linspace(1,c,5*c)';
new_y = linspace(1,r,5*r);
for i=1:3
    NEW_I(:,:,i)=uint8(interp2(x,y,double(I(:,:,i)),new_x,new_y,'spline'));
    NEW_I_L(:,:,i)=uint8(interp2(x,y,double(I(:,:,i)),new_x,new_y,'linear'));
end

subplot(1,3,1), subimage(I)
subplot(1,3,2), subimage(NEW_I_L),title('linear')
subplot(1,3,3),subimage(NEW_I),title('spline')



