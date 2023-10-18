function [batch_vector, train_loss, val_loss] = txt_to_data(fileName, print_every)

% Read file
fileID = fopen(fileName,'r');

% Handle document
formatSpec = '%s'; % String
inputStr  = fscanf(fileID, formatSpec);
disp(" ")

% Regular expression to match float values (including decimals)
floatPattern = '\d+\.\d+';

% Extract all float values from the input string
matches = regexp(inputStr, floatPattern, 'match');

% Initialize even and odd vectors
train_loss = [];
val_loss = [];

% Separate even and odd occurrences
for i = 1:numel(matches)
    if mod(i, 2) == 0
        val_loss = [val_loss, str2double(matches{i})];
    else
        train_loss = [train_loss, str2double(matches{i})];
    end
end

batch_vector = 0:print_every:print_every*length(val_loss)-1;

end

