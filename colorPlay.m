%%% change rgb to hsc
ix = imread('rice.png');
i = imresize(ix, [500,500]);

figure, imshow(i);
i1 = imopen(i, strel('disk', 9));
i3 = i - i1;
figure, imshow(i3);

i4 =  imadjust(i3);
figure, imshow(i4);

bw = imbinarize(i4);
figure, imshow(bw);

i6 = bwareaopen(bw, 200);
figure, imshow(i6);

figure, imshowpair(i,i6, 'montage');








