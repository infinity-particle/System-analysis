load carbig.mat

X = horzcat(MPG, Horsepower, Weight);
X(sum(isnan(X), 2) == 1, :) = [];

K = 4;
[G,C] = kmeans(X, K, 'distance','sqEuclidean', 'start','sample');

clr = lines(K);
figure, hold on
scatter3(X(:,1), X(:,2), X(:,3), 36, clr(G,:), 'Marker','.')
scatter3(C(:,1), C(:,2), C(:,3), 100, clr, 'Marker','o', 'LineWidth',3)
hold off
view(3), axis vis3d, box on, rotate3d on
xlabel('MPG'), ylabel('HP'), zlabel('Weight') 