function [Y]=Subnormal3

a = 1;

%x=[0,50000,100000,200000,300000,500000,1000000,2000000,3000000];
%x=[0,100000,200000,300000,500000,1000000,2000000,3000000];


w = 200;

Y=zeros(1,w);

for i= 1:w
  
    
    f(i)=(1-exp(-a*i)-a*i*exp(-a*i))/(a*i^2);  %density function
  
    Y(i)=f(i);
 

end

figure,
plot([1:w],Y,'b-');
xlabel('x');
ylabel('f(x)');
legend('Ours')

figure,
scatter([1:w],Y,'b');
xlabel('x');
ylabel('f(x)');
legend('Ours')


end