m1 = importdata('m1.txt');
m2 = importdata('m2.txt');

% 2 words
words = { 'Канада' 'Япония' };

clusterData = [m1, m2];

% return cluster indexes & centroids.
[indexes, cds] = kmeans(clusterData, 2);

shapes = {'bs', 'g^'};

for i = 1:2
    %find indexes of vectors by cluster number
    clust = find(indexes == i);
    
    %find vectors by cluster
    x = clusterData(clust, 1);
    y = clusterData(clust, 2);
    
    %drawing vectors
    plot(x, y, shapes{i});
    hold on
end

%drawing centroids
plot(cds(:,1), cds(:,2), 'k*');

hold off

xlabel(words{1});
ylabel(words{2});

grid on