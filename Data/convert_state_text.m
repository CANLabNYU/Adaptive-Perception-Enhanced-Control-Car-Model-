clear

% Initialize an empty array to store all data
allData = [];

% Loop through each text file
for i = 1 : 10
    % Create file name
    filename = sprintf('STOP/%d/data_State_Estimation_Total.txt', i);

    % Read data from text file
    fileID = fopen(filename, 'r');
    data = textscan(fileID, '%f');
    fclose(fileID);

    % Reshape data and transpose
    dataMatrix = reshape(data{1}, 5, 100)';

    % Append data to allData
    allData = [allData, dataMatrix(:, 2)];
    allData = [allData, dataMatrix(:, 4)];

end

% Write combined data to Excel
xlswrite("Data_Scenario_3_state.xlsx", allData);

disp('Data has been successfully written to Data_Scenario_3_state.xlsx');
