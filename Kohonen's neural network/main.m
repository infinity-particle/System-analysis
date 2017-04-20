countNeurons = 5;

m1 = transpose(importdata('./Data/m1.txt'));
m2 = transpose(importdata('./Data/m2.txt'));
m3 = transpose(importdata('./Data/m3.txt'));
m4 = transpose(importdata('./Data/m4.txt'));
m5 = transpose(importdata('./Data/m5.txt'));

P = [m1; m2; m3; m4; m5];

represP = xlsread('training.xlsx');

net = newsom(represP, countNeurons);
net.trainParam.epochs = 100;
net = train(net, represP);

a = sim(net, P);

for i = 1 : countNeurons
    mas(i, 1) = length(find(a(i,:) == 1));
end

fprintf('Clusters data: ');
fprintf('%d ', mas);

figure, plotsomhits(net, P);


