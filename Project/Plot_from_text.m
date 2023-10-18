clc; close all; clear all

%% Print every
print_every = 25;

%% Byt .txt fil här -->
fileName_seg = 'loss_seg.txt';
fileName_autoencoder = 'loss_autoencoder.txt';
fileName_color_seg = 'loss_color_seg.txt';

%% Detta blir titeln på plot samt filnamnet på .eps filen
title_of_plot_seg = "Segmentation loss";
title_of_plot_autoencoder = "Autoencoder loss";
title_of_plot_color_seg = "Autoencoder using segmentation loss";
title_of_plot_train_loss = "Train losses with and without segmentation";
title_of_plot_val_loss = "Validation losses with and without segmentation";

%% All data från filerna
[batch_vector_seg, train_loss_seg, val_loss_seg] = txt_to_data(fileName_seg, print_every);
[batch_vector_autoencoder, train_loss_autoencoder, val_loss_autoencoder] = txt_to_data(fileName_autoencoder, print_every);
[batch_vector_color_seg, train_loss_color_seg, val_loss_color_seg] = txt_to_data(fileName_color_seg, print_every);

%% Plot seg
figure
hold on; grid on; box on
title(title_of_plot_seg)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector_seg, val_loss_seg,'LineWidth',1.5)
plot(batch_vector_seg, train_loss_seg,'LineWidth',1.5)
legend("Validation loss", "Train loss")
saveas(gcf, title_of_plot_seg, 'epsc')

%% Plot color autoencoder
figure
hold on; grid on; box on
title(title_of_plot_autoencoder)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector_autoencoder, val_loss_autoencoder,'LineWidth',1.5)
plot(batch_vector_autoencoder, train_loss_autoencoder,'LineWidth',1.5)
ylim([0 250])
legend("Validation loss", "Train loss")
saveas(gcf, title_of_plot_autoencoder, 'epsc')

%% Plot color seg
figure
hold on; grid on; box on
title(title_of_plot_color_seg)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector_color_seg, val_loss_color_seg,'LineWidth',1.5)
plot(batch_vector_color_seg, train_loss_color_seg,'LineWidth',1.5)
legend("Validation loss", "Train loss")
saveas(gcf, title_of_plot_color_seg, 'epsc')


%% Plot train vs train
figure
hold on; grid on; box on
title(title_of_plot_train_loss)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector_autoencoder, train_loss_autoencoder, 'LineWidth',1.5)
plot(batch_vector_color_seg, train_loss_color_seg, 'LineWidth',1.5)
legend("Train loss without segmentation", "Train loss with segmentation")
saveas(gcf, title_of_plot_train_loss, 'epsc')

%% Plot val vs val
figure
hold on; grid on; box on
title(title_of_plot_val_loss)
xlabel("Batches")
ylabel("MSE Loss")
set(gcf,'color','w');
plot(batch_vector_autoencoder, val_loss_autoencoder, 'LineWidth',1.5)
plot(batch_vector_color_seg, val_loss_color_seg,'LineWidth',1.5)
ylim([0 250])
legend("Train loss without segmentation", "Train loss with segmentation")
saveas(gcf, title_of_plot_val_loss, 'epsc')