biologyDictionary = './Dictionaries/Biology.txt';
chemistryDictionary = './Dictionaries/Chemistry.txt';
physicsDictionary = './Dictionaries/Physics.txt';

file = fopen(physicsDictionary);

while ~feof(file)
    line = fgets(file);
    term = strtok(line, '-');
    fprintf('%s\n', term);
end