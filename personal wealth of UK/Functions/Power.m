function [Z]=Power
i=0;
a=11;%\mu 1.35目前最好
r=2;
s=15;
Z=zeros(1,s);

for x =a:s %x value range
  
    i=i+1;
    f(i)=2*a*x^(-r-1);%density function
    Z(i)=f(i);
   % l=i*f(i)+l;



%vpa(l)
%$figure,
% plot([1:s], f);
%  hold on;
% scatter(x,f(i),'b');%红

end

scatter([a:s],f,'k');
xlabel('x');
ylabel('f(x)');
end