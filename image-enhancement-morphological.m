% Name: Mauricio Gonzalez
% KSU ID: 001189051
% Assignment 3
clear all;
close all;
clc;

% CODE FOR EXPERIMENT 1 - Identify and Apply Morphological Operators

% Load image
srcMorph = imread('morphology.png');

% Ensure binary representation
if size(srcMorph, 3) == 3
    srcMorph = rgb2gray(srcMorph);
end
bwInput = imbinarize(srcMorph);

% Display the original noisy binary image
figure;
imshow(bwInput);

% Compact disk structuring element (radius 2)
seDisk = strel('disk', 2);

% Erosion using the disk structuring element
erodedImg = imerode(bwInput, seDisk);

% Display result
figure;
imshow(erodedImg);

% Opening strips away isolated bright specks/noise
openedImg = imopen(bwInput, seDisk);

% Closing seals any residual dark holes inside digits
dilatedImg = imclose(openedImg, seDisk);

% Display result
figure;
imshow(dilatedImg);

% CODE FOR EXPERIMENT 2 - Fingerprint Denoising: Morphological vs. Median

% Load image: converts to grayscale if color
% binarizes it into a black-and-white image for morphological tasks
fpRaw = imread('fingerprint_BW.png');
if size(fpRaw, 3) == 3
    fpRaw = rgb2gray(fpRaw);
end
fpBinary = imbinarize(fpRaw);

% Display original fingerprint
figure;
imshow(fpRaw);

% Morphological denoising open then close with a disk SE of radius 1
seDisk = strel('disk', 1);
fpMorphClean = imopen(fpBinary, seDisk);     % remove isolated bright specks
fpMorphClean = imclose(fpMorphClean, seDisk); % seal ridge breaks

% Display result
figure;
imshow(fpMorphClean);

% Median filter with a 3x3 neighborhood window
fpMedianClean = medfilt2(fpRaw, [3 3]);

% Display result
figure;
imshow(fpMedianClean);

% CODE FOR EXPERIMENT 3 - Laplacian Enhancement

% Load image: converts to grayscale if it's color, then converts to double precision
moonOrig = imread('moon.jpg');
if size(moonOrig, 3) == 3
    moonGray = rgb2gray(moonOrig);
else
    moonGray = moonOrig;
end
moonDbl = im2double(moonGray);

% Display original moon image
figure;
imshow(moonGray);

% Standard Laplacian kernel with negative center
lapMask = [0  1  0;
           1 -4  1;
           0  1  0];

% Compute the Laplacian response using border replication
lapResponse = imfilter(moonDbl, lapMask, 'replicate');

% Display result
figure;
imshow(im2uint8(mat2gray(lapResponse)));

% Sharpen by subtracting the Laplacian using negative-center convention
moonSharpened = moonDbl - lapResponse;

% Rescale to valid [0,1] range and convert to uint8
moonSharpened = im2uint8(mat2gray(moonSharpened));

% Display result
figure;
imshow(moonSharpened);
