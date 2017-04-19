% 15 texts
texts = {'physics1.txt' 'physics2.txt' 'physics3.txt' 'physics4.txt' 'physics5.txt'  'chemistry1.txt' 'chemistry2.txt' 'chemistry3.txt' 'chemistry4.txt' 'chemistry5.txt' 'math1.txt' 'math2.txt' 'math3.txt' 'math4.txt' 'math5.txt'};

f = fopen('physics_termins.txt');
physics_termins = textscan(f, '%s', 'Delimiter', '\r\n');
physics_termins = physics_termins{1};
physics_termins_count = length(physics_termins);

f = fopen('chemistry_termins.txt');
chemistry_termins = textscan(f, '%s', 'Delimiter', '\r\n');
chemistry_termins = chemistry_termins{1};
chemistry_termins_count = length(chemistry_termins);

f = fopen('math_termins.txt');
math_termins = textscan(f, '%s', 'Delimiter', '\r\n');
math_termins = math_termins{1};
math_termins_count = length(math_termins);

shapes = {'bs', 'c^', 'rd'};

textsCount = length(texts);

clusterData = zeros(1, 3);

firstFlag = 0;


for i = 1 : textsCount
    textName = texts(1, i); % get cell
    textName = textName{1}; % to string
    
    fileData = fileread(textName);
    fileData = lower(fileData);
    
    length1 = 0;
    for j = 1 : physics_termins_count
        word = physics_termins(j);
        word = word{1};
        word = lower(word);
        length1 = length1 + length(strfind(fileData, word));
    end
    
    length2 = 0;
    for j = 1 : chemistry_termins_count
        word = chemistry_termins(j);
        word = word{1};
        word = lower(word);
        length2 = length2 + length(strfind(fileData, word));
    end
    
    length3 = 0;
    for j = 1 : math_termins_count
        word = math_termins(j);
        word = word{1};
        word = lower(word);
        length3 = length3 + length(strfind(fileData, word));
    end
    
    themeEntries = [ length1 length2 length3];

    size = length(clusterData(:, 1));

    if(firstFlag > 0)
       size = size + 1;
    else
        firstFlag = 1;
    end

    clusterData(size, :) = themeEntries;
end

% return cluster indexes & centroids.
[indexes, cds] = kmeans(clusterData, 3);

hold on

for i = 1:3
    %find indexes of vectors by cluster number
    clust = find(indexes == i);
    
    %find vectors by cluster
    x = clusterData(clust, 1);
    y = clusterData(clust, 2);
    z = clusterData(clust, 3);
    
    %drawing vectors
    plot3(x, y, z, shapes{i});
end

%drawing centroids

plot3(cds(:,1), cds(:,2), cds(:,3), 'k*');

hold off

xlabel('physics');
ylabel('chemistry');
zlabel('math');

view(50,30); % angle
grid on