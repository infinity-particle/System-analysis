function dictionary = getDictionary( fileName )
file = fopen(fileName);
dictionary = textscan(file, '%s', 'Delimiter', '-');
dictionary = dictionary{1};
end

