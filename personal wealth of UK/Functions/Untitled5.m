clear;
syms m ;
a=3;%\mu
b=1;%\sigma
c=pi;
s=10;
i=0;
l=0;%expected value
r=2;

for x =0:s %x value range
  

    i=i+1;
    f1(i)=(1/x*(sqrt(2*c)*b))*exp(-((log(x)-a)^2)/(2*b^2));%density function
  



end
%vpa(l)
%$figure,
% plot([1:s], f);



hold on;

% scatter(xx,f1,'r');%ºì
% 
% scatter(xx,f2,'b');%ºì
% 
% scatter(xx,f3,'k');%ºì


%xx=xx-1;
plot([0:s],f1,'r');
xlabel('x');
ylabel('f(x)');

hold off;