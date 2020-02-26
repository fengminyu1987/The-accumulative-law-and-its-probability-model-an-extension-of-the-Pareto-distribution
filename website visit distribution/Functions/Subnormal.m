function [Y]=Subnormal(x, para)
syms m ;

a = para.a;
b = para.b;
c = para.c;
r = para.r;


%x=[0,50000,100000,200000,300000,500000,1000000,2000000,3000000];
%x=[0,100000,200000,300000,500000,1000000,2000000,3000000];




Y=zeros(1,length(x));

for i=1:length(x)
  
    
    f(i)=int(((r*(m^(r-1)/x(i)^(r+1)))/(sqrt(2*c)*b))*exp(-((log(m)-a)^2)/(2*b^2)),m,0,x(i));%density function
  
    Y(i)=f(i);
 

end


end