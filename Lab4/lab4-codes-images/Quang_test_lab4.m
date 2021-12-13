% load cdata.mat
% figure(1);plot(cdata(:,1),cdata(:,2),'.');

% I = imread('handBW.pnm'); % Read the image
% figure(2);imshow(I); % Show the image
% figure(3);imhist(I); % Show the histogram
% 
% figure(4);mtresh(I,t1,t2);

% I2 = imread('hand.pnm'); % Read the image
% figure(5);imshow(I2); % Show the image
% R = I2(:,:,1); % Separate the three layers, RGB
% G = I2(:,:,2);
% B = I2(:,:,3);
% figure(6);plot3(R(:),G(:),B(:),'.') % 3D scatterplot of the RGB data
% 
% label_im = imread('hand_training.png'); % Read image with labels
% figure(7);imagesc(label_im); % View the training areas
% 
% I3(:,:,1) = R; % Create an image with two bands/features
% I3(:,:,2) = B;
% [data,class] = create_training_data(I3,label_im); % Arrange the training data into vectors
% figure(8);scatterplot2D(data,class); % View the training feature vectors
% 
% Itest = im2testdata(I3); % Reshape the image before classification
% C = classify(double(Itest),double(data),double(class)); % Train classifier and classify the data
% ImC = class2im(C,size(I3,1),size(I3,2)); % Reshape the classification to an image
% figure(9);imagesc(ImC); % View the classification result

load landsat_data

forest_ind_y = 134:134+136;
    
forest_ind_x = 443:423+69;

city_ind_y = 53 : 108 + 53;

city_ind_x = 166 : 166 + 66;

ag_ind_y = 344: 344 + 75;
ag_ind_x = 298: 298 + 123;

water_ind_y = 17:17+58;
water_ind_x = 484:484+28;


T = zeros(512,512);

T(forest_ind_x, forest_ind_y) = 1;

T(city_ind_x, city_ind_y) = 2;

T(ag_ind_x, ag_ind_y) = 3;

T(water_ind_x, water_ind_y) = 4;


land_sat_c1 = landsat_data(:,:,1);
land_sat_c2 = landsat_data(:,:,2);
land_sat_c3 = landsat_data(:,:,3);
land_sat_c4 = landsat_data(:,:,4);
land_sat_c5 = landsat_data(:,:,5);
land_sat_c6 = landsat_data(:,:,6);
land_sat_c7 = landsat_data(:,:,7);

combos = combntns(1:7,3);

landsat_train(:, :, 1) = landsat_data(:, :, 1);
landsat_train(:, :, 2) = landsat_data(:, :, 2);


[data,class] = create_training_data(landsat_train, T); % Arrange the training data into vectors
figure(8);scatterplot2D(data,class); % View the training feature vectors

Itest = im2testdata(landsat_train); % Reshape the image before classification
C = classify(double(Itest),double(data),double(class)); % Train classifier and classify the data
ImC = class2im(C,size(landsat_train, 1),size(landsat_train, 2)); % Reshape the classification to an image
figure(9);imagesc(ImC); % View the classification result



