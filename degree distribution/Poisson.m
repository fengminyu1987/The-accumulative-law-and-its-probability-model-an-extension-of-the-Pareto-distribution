function ti=Poisson()
%��Ҫ��Ŀ�������10HZ������%
%clear ti;
disp('Poisson setting: r and t ')
r=input('\lambda=');%���Ը�
t=input('t=');%���Ը�
pi=r*0.001*exp(-r*0.001);
for i=1:1:1      %���������ٸ�ͻ������ɼ�����ݣ�
    tempt=rand(1,1000*t);%������ʱ��
    k=1;
    for j=1:1:1000*t
        if tempt(j)<pi
            ti(i,k)=j;
            k=k+1;
        end
    end
end
%disp(ti);
end