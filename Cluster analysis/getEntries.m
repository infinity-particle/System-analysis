function entries = getEntries( article, dictionary )
    entries = 0;
    for i = 1 : length(dictionary)
        term = dictionary(i);
        term = term{1};
        term = lower(term);
        %fprintf('%s\n', term);
        entries = entries + length(strfind(article, term));
    end
end

