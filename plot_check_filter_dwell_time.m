th = 20;
meancurrent = 17.7343;
data = dfilt;
ttemp = t;
dwelltime = dt;
dropamplitude = -(drpamp./meancurrent);
cutoffamp = 0.8;


[drp, rise, dp] = identify_current_drops(data, th, 0.5, 0.95);
plot(ttemp, data)
hold on
plot(ttemp(drp), data(drp), 'rx')
plot(ttemp(rise), data(rise), 'go')
hold off

newdt = [];
newdp = [];

for jj=1:length(dwelltime)
    if dropamplitude(jj) > cutoffamp
        newdt = [newdt, dwelltime(jj)];
        newdp = [newdp, dropamplitude(jj)];
    end
end

figure
hist(newdt, 20)

%tot_time = length([t1, t2, t3, t4])/5000;