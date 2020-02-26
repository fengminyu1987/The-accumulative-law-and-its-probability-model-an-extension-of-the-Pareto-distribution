function [Y]=Subnormal2(x, para)

a = para.a;

Y=zeros(1,length(x));

for i= 1:length(x)
     
    j = x(i);
    
    f(i)=(1-exp(-a*j)-a*j*exp(-a*j))/(a*j^2);%density function
  
    Y(i)=f(i);
 

end


end