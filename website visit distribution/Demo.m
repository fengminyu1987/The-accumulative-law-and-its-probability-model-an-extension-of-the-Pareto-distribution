clear; close all;
addpath('Functions');

%% ========Start Demo =======
%fprintf('DataType = 1 (personal wealth-from pdf)\n')
%fprintf('DataType = 2 (personal wealth-from excel)\n')
%fprintf('DataType = 3 (traffic_data)\n')
fprintf('DataType = 4 (web_vist_data)\n')

DataType = input('Please input 4 to start = ');

switch DataType
    case 1 % data 1: (Personal Wealth)
        x =[0,100000,200000,300000,500000,1000000,2000000,3000000];
        y =[0,829+954, 2808+60, 2483+62, 2004+106, 1136+111, 222+50, 101+34]/(10537+477);
        xx=[0,1,2,3,5,10,20,30];  % for our method, need to divide 10^5
        
    case 2
        x =[0,100000,200000,300000,500000,1000000,2000000,3000000];
        y =[0,709+1271+22+21, 3320+62, 2391+87, 1846+114, 964+143, 265+73, 111+47]/(10876+568);
        xx=[0,1,2,3,5,10,20,30];  % for our method, need to divide 10^5

    case 3 % data 3: (traffic_data: http://mawi.wide.ad.jp/mawi/samplepoint-C/2008/200806161800.html)
        load data_traffic.txt;
        x =data_traffic(:,1)';
        y =data_traffic(:,2)'/sum(data_traffic(:,2));
        xx=[0,1,2,3,5,10,20,30];  % for our method, need to divide 10^5
    
    case 4 % data 4: (web_vist: from excel file)
        load web_vist.txt;
        data = web_vist';
        x = unique(data);  % appeared numbers!
        [y, w] = hist(data, x);
        y = y/sum(y);
        
end

%% =====true dist. =======
l1_tmp=Fin(x, y);  %compute the degree distribution of the network
l1=l1_tmp';

%% =====our dist. ========
%a = input('Please input the a in subnorm func. =');
para.a = 0.19;%parameter setting
%para.b = 3;
%para.c = pi;
%
l2_tmp = Subnormal2(x, para);
%l2_tmp = Subnormal3(para);
l2     = l2_tmp';

a1=l1(1:750);
a2=l2(1:750);

figure,
scatter(x,l2_tmp,'b');
hold on
scatter(x,l1_tmp,'r');
xlabel('x');
ylabel('f(x)');
legend('Ours', 'True')

figure,
plot(x(4:7093),l2_tmp(4:7093),'b-', 'Linewidth', 2);
hold on
plot(x(4:7093),l1_tmp(4:7093),'o');
xlabel('x');
ylabel('f(x)- for first 40 values');
legend('Ours', 'True')

%% ======Compute metric ======
fprintf('Cor. Coef. = \n')
R  =  corrcoef(a1,a2)

val = KLDiv(a1, a2);
fprintf('KL-div = %f\n', val)

ReErr = norm(l1-l2)/norm(l1);
fprintf('ReErr = %f\n', ReErr)
% % %% =====plot the results (Bar Imgs)======
% figure,
% bar(l1,'g')
% set(gca, 'XTickLabel', {'0','1','2','3', '5', '10', '20', '30'})
% xlabel('Wealth, \times10^{5}');
% hold on
% plot(l2, 'r*-', 'Linewidth', 2)



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
