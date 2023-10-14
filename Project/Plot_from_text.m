clc
close all
clear all

% Byt .txt fil här
fileID = fopen('loss_seg.txt','r');
% Detta blir titeln på plot samt filnamnet på .eps filen
title_of_plot = "Segmentation loss";

formatSpec = '%s'; % String
inputStr  = fscanf(fileID,formatSpec);
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
        train_loss = [train_loss, str2double(matches{i})];
    else
        val_loss = [val_loss, str2double(matches{i})];
    end
end

print_every = 25;
batch_vector = 0:print_every:print_every*length(val_loss)-1


figure(1)
hold on
grid on
box on
title(title_of_plot)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector,train_loss,'LineWidth',2)
plot(batch_vector, val_loss,'LineWidth',2)
legend("Train loss", "Validation loss")
saveas(gcf,title_of_plot,'epsc')