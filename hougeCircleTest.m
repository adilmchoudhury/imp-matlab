%%read image
i =  imread('~/Desktop/4.png');
j=rgb2gray(i); 

%figure out the pad value to pad to white
if isinteger(j)
   pad = intmax(class(j));
else
   pad = 1;   %white for floating point is 1.0
end

[r, c, ~] = size(j)
if r > c
  newImage = imresize(j, 512 / r);
  newImage(:, end+1 : 512, :) = pad;
elseif c > r
  newImage = imresize(j, 512 / c);
  newImage(end+1 : 512, :, :) = pad;
else
  newImage = imresize(j, [512, 512]);
end
k=newImage;
figure
imshow(k);
title('HougeCircle');
rMin = 10;
rMax = 90;
[centersDark1, radiiDark1] = imfindcircles(k, [rMin, rMax], 'ObjectPolarity', 'dark', 'Sensitivity', 0.95);
viscircles(centersDark1, radiiDark1, 'LineStyle', '--')


