function dictionary = getDictionary( fileName )
file = fopen(fileName);
dictionary = textscan(file, '%s', 'Delimiter', '\r\n');
dictionary = dictionary{1};
end

