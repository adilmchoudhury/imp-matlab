%%% change rgb to hsc
ix = imread('peppers.png');
i = imresize(ix, [500,500]);
HSV = rgb2hsv(i);

H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

figure, imshow(V);
