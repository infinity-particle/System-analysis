function dictionary = getDictionary( fileName )
file = fopen(fileName);
dictionary = textscan(file, '%s %*[^\n]');
dictionary = dictionary{1};
end

