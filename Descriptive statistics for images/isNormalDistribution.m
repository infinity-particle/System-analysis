function result = isNormalDistribution( image )
I1 = reshape(im2double(image),1,[]);
if chi2gof(I1)
    result = 'true';
else
    result = 'false';
end

