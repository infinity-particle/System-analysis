function result = isNormalDistribution( image )
I1 = reshape(im2double(image),1,[]);
if chi2gof(I1)
    result = 'false';
else
    result = 'true';
end

