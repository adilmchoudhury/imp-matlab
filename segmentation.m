I = imread('cameraman.tif');
%figure, imshow(I);
I1 = histeq(I);
%figure, imshow(I1);
%figure, imshowpair(I,I1,'montage');


h= fspecial('disk', 5);
c = imfilter(I,h);
figure, imshowpair(I,c,'montage');

%{
%median filter
A = medfilt2(I, [7 7]);
%figure, imshow(A);
%figure, imshowpair(I,A,'montage');
%gaussian filter
B = imgaussfilt(I,1);
%figure, imshowpair(I,B,'montage');
%segmentation

S = im2bw (I);
S2 = multithresh(I);

A = imread('coins.png');
B = multithresh(A,2);
C = im2bw(A,.35);

%figure, imshowpair(A,B,'montage');
I = imread ('circlesBrightDark.png');
A = multithresh(I,2);
B = imquantize(I,A);
C = label2rgb(B);
%figure, imshowpair(I,A,'montage');
%figure, imshowpair(I,B,'montage');
%figure, imshowpair(I,C,'montage');

I = imread('coins.png');
level = graythresh(I)
c = im2bw (I,level );
c = label2rgb(c);
%figure, imshowpair(I,c,'montage');
I = imread('C:\Users\student\Documents\MATLAB\bt.JPG');
%figure, imshow(I);

HSV = rgb2hsv(I);
H = HSV (:,:,1);
S = HSV (:,:,2);
V = HSV (:,:,3);
V = medfilt2(V,[7 7]);
%V = 1 - V;
Im = hsv2rgb(H,S,V);
%figure, imshowpair(I,Im,'montage');
L = Im (:, : ,2) + Im (:, :, 3);
p = mat2gray(L);
%figure,imshow(p);
c = imcomplement(p);
%figure,imshow(c);
bw = im2bw(c);
h = imfill(bw, [5 5]);
figure,imshow(h);
h = imcomplement(h);

figure,imshow(h);
[LabeledImage numberOfObjects] = bwlabel(h);
blobMeasurements = regionprops(LabeledImage,'Perimeter','Area');
BlobPerimeters = [blobMeasurements.Perimeter];
BlobArea = [blobMeasurements.Area];
AreaIndex = ((BlobArea >= 200) & (BlobArea <= 1200));
Index1 = find(AreaIndex);
BlobImage = ismember(LabeledImage, Index1);
ABC = bwlabel(BlobImage, 8);
figure, imshow(ABC,[10 10]); 
%}