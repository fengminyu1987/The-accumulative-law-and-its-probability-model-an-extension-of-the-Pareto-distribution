function [Y]=Subnormal(s, a, b)
syms m ;
% a=3;%??\mu ������д���ֶ����룬��������̬�ֲ���\mu
% b=1;%??\sigma������д���ֶ����룬��������̬�ֲ���\sigma
c=pi;
%s=100;%????

i=0;
r=2;%1.9
Y=zeros(1,s);
%x=[0,0.5,1,2,3,5,10,20,30];
for i=1:s
    
    
    f(i)=int(((r*(m^(r-1)/i^(r+1)))/(sqrt(2*c)*b))*exp(-((log(m)-a)^2)/(2*b^2)),m,0,i);%density function
  
    Y(i)=f(i);
 

end

f=[0 f];
%plot(x,f,'b');
plot([0:s],f,'b-', 'Linewidth', 2);
%scatter(x,f,'b');
xlabel('x');
ylabel('f(x)');
end