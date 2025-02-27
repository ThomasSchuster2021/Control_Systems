function dataArray = struct2ArrayForMe(dataStruct)
dataStruct = struct2cell(dataStruct);
times = dataStruct{1};
signals = struct2cell(dataStruct{2});
volt = signals{1,1,1};
data = signals{1,1,2};
for i = 1:length(data(1,1,:))
    dataUse(i,:) = data(:,1,i);
end
dataArray = [times volt dataUse];
end