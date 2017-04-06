marvelImage = imread('marvel.jpg');
foodImage = imread('food.jpg');

fprintf('Marvel image statistics: \n');
printDescriptiveStatistic(marvelImage);
fprintf('\n');

fprintf('Food image statistics: \n');
printDescriptiveStatistic(foodImage);
fprintf('\n');

marvelImageHistogram = imhist(rgb2gray(marvelImage));
foodImageHistogram = imhist(rgb2gray(foodImage));
 
figure, imhist(rgb2gray(marvelImage));
figure, imhist(rgb2gray(foodImage));

fprintf('Correlation between images: %.2f\n', corr2(rgb2gray(marvelImage), rgb2gray(foodImage)));
fprintf('Correlation between histograms: %.2f\n', corr2(marvelImageHistogram, foodImageHistogram));
fprintf('\n');

fprintf('Correlation between marvel image layers: \n');
printCorrelationBetweenImageLayers(marvelImage);
fprintf('\n');

fprintf('Correlation between food image layers: \n');
printCorrelationBetweenImageLayers(foodImage);
fprintf('\n');

fprintf('Testing hypotheses about the normal distribution: \n');
fprintf('\tFor marvel image: %s\n', isNormalDistribution(rgb2gray(marvelImage)));
fprintf('\tFor food image: %s\n', isNormalDistribution(rgb2gray(foodImage)));