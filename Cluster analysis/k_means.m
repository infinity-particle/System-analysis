m1 = importdata('./k-means/m1.txt');
m2 = importdata('./k-means/m2.txt');

words = { 'USA' 'Russia' };

clusterData = [m1, m2];

[indexes, cds] = kmeans(clusterData, 2);

hold on
 
for i = 1:2
    clust = find(indexes == i);
    
    x = clusterData(clust, 1);
    y = clusterData(clust, 2);
    
    plot(x, y, 'o');
end

plot(cds(:,1), cds(:,2), 'k*');

hold off

xlabel(words{1});
ylabel(words{2});

grid on