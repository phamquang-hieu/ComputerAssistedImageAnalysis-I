I = imread('cameraman.png');
imtool(I)

Jnf = imresize(I, [128 128], 'nearest', 'antialiasing', false);
x = fft(Jnf);
Jnt = imresize(I, [128 128], 'nearest', 'antialiasing', true);
y = fft(Jnt);
Jbf = imresize(I, [128 128], 'bilinear', 'antialiasing', false);
z = fft(Jbf);
Jbt = imresize(I, [128 128], 'bilinear', 'antialiasing', true);
a = fft(Jbt);



imtool(Jnf)

imtool(Jnt)

imtool(Jbf)

imtool(Jbt)
