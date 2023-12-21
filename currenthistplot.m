function [out, histY] = currenthistplot(data)
    dataf = table2array(data);
    curramp = str2double(dataf(:,4));
    histY = str2double(dataf(:,5));
    plot(curramp, histY)
    out = [];
    for ii = 1:length(curramp)
        if ~isnan(histY(ii)) && histY(ii) ~= 0
            for jj = 1:histY(ii)
                out = [out, curramp(ii)];
            end
        end
    end


end