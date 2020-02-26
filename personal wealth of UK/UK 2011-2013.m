clear; close all;
addpath('Functions');

%% ========Start Demo =======
fprintf('DataType = 1 (UK 2011-2013)\n')
fprintf('DataType = 2 (UK 2014-2016)\n')
DataType = input('Please input DataType = ');
switch DataType
    case 1 % data 1: (Personal Wealth)
        x=[0,100000,200000,300000,500000,1000000,2000000,3000000];
        y=[0,829+954, 2808+60, 2483+62, 2004+106, 1136+111, 222+50, 101+34]/(10537+477);
        xx=[0,1,2,3,5,10,20,30];  % for our method, need to divide 10^5
        
    case 2
        x=[0,100000,200000,300000,500000,1000000,2000000,3000000];
        y=[0,709+1271+22+21, 3320+62, 2391+87, 1846+114, 964+143, 265+73, 111+47]/(10876+568);
        xx=[0,1,2,3,5,10,20,30];  % for our method, need to divide 10^5
        
end
%% =====true dist. =======
l1_tmp=Fin(x, y);%compute the degree distribution of the network
l1=l1_tmp';

%% =====our dist. ========
para.a = 1.2;%parameter setting
para.b = 0.9;
para.c = pi;
para.r = 1;

l2_tmp = Subnormal(xx, para);
l2     = 2.6*l2_tmp';

figure,
scatter(xx,l2_tmp,'b');
xlabel('x');
ylabel('f(x)');

%% ======Compute metric ======
fprintf('Cor. Coef. = \n')
R  =  corrcoef(l1,l2)

val = KLDiv(l1, l2);
fprintf('KL-div = %f\n', val)

%% =====plot the results======
figure,
bar(l1,'g')
set(gca, 'XTickLabel', {'0','1','2','3', '5', '10', '20', '30'})
xlabel('Wealth, \times10^{5}');
hold on
plot(l2, 'r*-', 'Linewidth', 2)
















%% =====Not Used ========
%figure,
%bar([1 2 3 5 10 20 30], l1_p)
%bar(l1_p, 1, 'w', 'EdgeColor','b')
%bar(l1)
%set(gca, 'XTickLabel', {'1\times10^{5}','2\times10^{5}','3\times10^{5}', '5\times10^{5}', '10\times10^{5}', '20\times10^{5}', '30\times10^{5}'})
%set(gca, 'XTickLabel', {'0','1','2','3', '5', '10', '20', '30'})
%xlabel('Wealth');
% for i=1:length(l1_p)
% 
%     text(i,l1_p(i),num2str(l1_p(i)),'VerticalAlignment','bottom',...
%     'HorizontalAlignment','center','FontSize',9,'color','r','FontWeight','bold')
% 
% end
%% ======================
