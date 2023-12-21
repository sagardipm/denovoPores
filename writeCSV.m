function [data] = writeCSV(ti, di, filename)
var = 1;
columnNames = {'time', sprintf('channel%d', var)};
if size(di, 2) > 1
    var = 2;
    for jj = 2:size(di, 2)
        columnNames = [columnNames, sprintf('channel%d', var)];
        var = var + 1;
    end
end

writecell(columnNames, filename, 'WriteMode', 'append', 'Delimiter', ',');

if isequal(size(ti, 1), size(di, 1))
    data = [ti, di];
elseif isequal(size(ti', 1), size(di, 1))
    data = [ti', di];
end

writematrix(data, filename, 'WriteMode', 'append', 'Delimiter', ',');
