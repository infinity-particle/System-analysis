function printDescriptiveStatistic(image)
grayscaleImage = rgb2gray(image);
averageValue = mean2(grayscaleImage);
standardDeviation = std2(grayscaleImage);
imageMedian = median(median(grayscaleImage));
moda = mode(mode(grayscaleImage));

fprintf('\tAverage value = %d\n', averageValue);
fprintf('\tStandart deviation = %d\n', standardDeviation);
fprintf('\tMedian = %d\n', imageMedian);
fprintf('\tMode = %d\n', moda);
end

