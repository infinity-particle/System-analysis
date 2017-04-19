function printDescriptiveStatistic(image)
grayscaleImage = rgb2gray(image);
averageValue = mean2(grayscaleImage);
standardDeviation = std2(grayscaleImage);
imageMedian = median(median(imhist(grayscaleImage)));
moda = mode(mode(grayscaleImage));

fprintf('\tAverage value = %.3d\n', averageValue);
fprintf('\tStandart deviation = %.3d\n', standardDeviation);
fprintf('\tMedian = %.3d\n', imageMedian);
fprintf('\tMode = %.3d\n', moda);
end

