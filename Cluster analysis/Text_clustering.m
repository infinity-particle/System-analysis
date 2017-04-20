themes = {'./Biology','./Chemistry','./Physics'};

biologyDictionary = getDictionary('./Dictionaries/Biology.txt');
chemistryDictionary = getDictionary('./Dictionaries/Chemistry.txt');
physicsDictionary = getDictionary('./Dictionaries/Physics.txt');

shapes = {'bs', 'c^', 'rd'};

clusterData = zeros(1, 3);

firstFlag = 0;

for i = 1 : length(themes)
    path = themes(1, i);
    path = path{1};
    
    articles = dir(strcat(path, '/', '*.txt'));
    
    for j = 1 : length(articles)
        articleName = articles(j).name;

        fileData = fileread(strcat(path, '/', articleName));
        fileData = lower(fileData);

        biologyEntries = getEntries(fileData, biologyDictionary);
        chemistryEntries = getEntries(fileData, chemistryDictionary);
        physicsEntries = getEntries(fileData, physicsDictionary);

        themeEntries = [biologyEntries chemistryEntries physicsEntries];

        size = length(clusterData(:, 1));

        if(firstFlag > 0)
           size = size + 1;
        else
            firstFlag = 1;
        end

        clusterData(size, :) = themeEntries;
    end
end

[indexes, cds] = kmeans(clusterData, 3);

hold on

for i = 1:3
    clust = find(indexes == i);

    x = clusterData(clust, 1);
    y = clusterData(clust, 2);
    z = clusterData(clust, 3);
    
    plot3(x, y, z, 'o');
end

plot3(cds(:,1), cds(:,2), cds(:,3), 'k*');

hold off

xlabel('Biology');
ylabel('Chemistry');
zlabel('Physics');

view(50,30), rotate3d on;
grid on