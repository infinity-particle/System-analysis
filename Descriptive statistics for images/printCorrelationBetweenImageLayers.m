function printCorrelationBetweenImageLayers( image )
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

fprintf('\tR and G: %.2f\n', corr2(R,G));
fprintf('\tG and B: %.2f\n', corr2(G,B));
fprintf('\tR and B: %.2f\n', corr2(R,B));
end

