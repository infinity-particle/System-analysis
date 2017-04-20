% m1 = importdata('./k-means/m1.txt');
% m2 = importdata('./k-means/m2.txt');
% 
% words = { 'USA' 'Russia' };
% 
% clusterData = [m1, m2];
% 
% [indexes, cds] = kmeans(clusterData, 2);
% 
% hold on
%  
% for i = 1:2
%     clust = find(indexes == i);
%     
%     x = clusterData(clust, 1);
%     y = clusterData(clust, 2);
%     
%     plot(x, y, 'o');
% end
% 
% plot(cds(:,1), cds(:,2), 'k*');
% 
% hold off
% 
% xlabel(words{1});
% ylabel(words{2});
% 
% grid on

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