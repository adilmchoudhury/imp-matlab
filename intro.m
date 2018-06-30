%%% reading the image
i = imread('peppers.png');
figure, imshow(i);

%%% showing the info the image
%imfinfo('peppers.png')

%%% dividing the images into RGB
r = i(:,:,1);

%%% adjusting the image 
radj = imadjust(r);

%%% equalize the histogram
g1 = histeq(r);

%%figure, imshow(r);
g = i(:,:,2);
gadj = imadjust(g);

%%%equalize the histogram
g2 = histeq(g);
%%figure, imshow(g);
b = i(:,:,3);
badj = imadjust(b);

%%%equalize the histogram
g3 = histeq(b);
%%figure, imshow(b);


%concating the splitted images
B = cat(3, radj,badj,gadj);
figure, imshow(B);

H = cat(3, g1, g2, g3);
figure, imshow(H);

% adding images
D = imadd(B,H);
figure, imshow(D);
%checking the histogram view of the image 
%%figure, imhist(r);

%histogram equalization( transfrom intensity image 


% showing the opposite valuse of images
a = 1- im2double(i);
%%figure,imshow(a);

%%% resize the image
p = imresize(i, [100,100]);
figure, imshow(p);
