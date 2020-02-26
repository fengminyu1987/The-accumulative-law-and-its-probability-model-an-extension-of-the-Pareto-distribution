clear;
% C=load('ca-AstroPh');
%P=importdata('matrix.txt');
disp('Growing network');
m0=input('Input the initial scale (note that it cannot be too small)=');
a = input('a (lognrnd for networks)=');% default: m0=100, a=3, b=1
b = input('b (lognrnd for networks)=');
P=growing(m0, a, b);

l1_tmp=drawscatter(P);%compute the degree distribution of the network
l1=(l1_tmp(:,1:100))';%����Ұ�?00���д���ֶ����룬Ҳ��Ӧsubnormal�������s
%save xianshi.txt l1 -ascii;
%Clustering_Coefficient(P);
%Aver_Path_Length(P);
hold on;
% P=ba_net();
s = input('Input s (length, more than 100)=');
a = input('\mu (accumulative distribution)=');% default: m0=100, a=3, b=1
b = input('\sigma (accumulative distribution)=');
l2_tmp=Subnormal(s, a, b);
l2=(l2_tmp(:,1:100))';%the length of vector
% save moni.txt l2 -ascii;
R=corrcoef(l1,l2)%compute the correlation coefficient of the two degree distribution
%[R,P]=corrcoef(l1,l2)%compute the correlation coefficient of the two degree distribution
% Clustering_Coefficient(P);
% Aver_Path_Length(P);

[tbl,chi2,p,labels] = crosstab(l1, l2);

val = KLDiv(l1, l2);


%%%%%%%%%%%%%%%%%subfunction%%%%%%%%%




