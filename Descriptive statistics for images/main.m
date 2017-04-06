treesImage = imread('trees.jpg');
foodImage = imread('food.jpg');

fprintf('Trees image statistics: \n');
printDescriptiveStatistic(treesImage);
fprintf('\n');

fprintf('Food image statistics: \n');
printDescriptiveStatistic(foodImage);
fprintf('\n');

marvelImageHistogram = imhist(rgb2gray(treesImage));
foodImageHistogram = imhist(rgb2gray(foodImage));
 
figure, imhist(rgb2gray(treesImage));
figure, imhist(rgb2gray(foodImage));

fprintf('Correlation between images: %.2f\n', corr2(rgb2gray(treesImage), rgb2gray(foodImage)));
fprintf('Correlation between histograms: %.2f\n', corr2(marvelImageHistogram, foodImageHistogram));
fprintf('\n');

fprintf('Correlation between trees image layers: \n');
printCorrelationBetweenImageLayers(treesImage);
fprintf('\n');

fprintf('Correlation between food image layers: \n');
printCorrelationBetweenImageLayers(foodImage);
fprintf('\n');

fprintf('Testing hypotheses about the normal distribution: \n');
fprintf('\tFor trees image: %s\n', isNormalDistribution(rgb2gray(treesImage)));
fprintf('\tFor food image: %s\n', isNormalDistribution(rgb2gray(foodImage)));