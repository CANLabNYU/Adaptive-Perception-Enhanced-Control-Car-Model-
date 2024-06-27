clear

% Initialize an empty array to store all data
allData = [];

% Loop through each text file
for i = 1 : 10
    % Create file name
    filename = sprintf('BACK/%d/data_State_Estimation_pos.txt', i);

    % Read data from text file
    fileID = fopen(filename, 'r');
    data = textscan(fileID, '%f');
    fclose(fileID);

    % Reshape data and transpose
    dataMatrix = reshape(data{1}, 2, 100)';

    % reverse second col
    dataMatrix(:, 2) = -dataMatrix(:, 2);

    % Append data to allData
    allData = [allData, dataMatrix];

end

% Write combined data to Excel
xlswrite("Data_Scenario_4_pos.xlsx", allData);

disp('Data has been successfully written to Data_Scenario_4_pos.xlsx');
