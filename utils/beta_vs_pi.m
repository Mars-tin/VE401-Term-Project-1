clear;clc
 

%{
%poisson \beta
 for n=[10,13,50,80,125]
     ret=[];
 c=cn(n);
 sum=0;
 p=0:0.001:1;
     for d=0:1:c
         sum=sum+(n.*p).^d.*exp(-n.*p)./factorial(d);
     end
    ret=[ret,sum];
    plot(p,ret);
    hold on;
 end
 legend('n=10','n=13','n=50','n=80','n=125');
 xlabel('\Pi');
ylabel('\beta');
 %}
 
 
 

%{
%binomial \beta 
  for n=[10,13,50,80,125]
     ret=[];
 c=cn(n);
 sum=0;
 p=0:0.001:1;
     for d=0:1:c
         sum=sum+nchoosek(n,d).*p.^d.*(1-p).^(n-d);
     end
    ret=[ret,sum];
    plot(p,ret);
    hold on;
 end
 legend('n=10','n=13','n=50','n=80','n=125');
 xlabel('\Pi');
ylabel('\beta');
%}
 
 
 
function c=cn(n)
c=0*(n==10)+1*(n==13)+3*(n==50)+5*(n==80)+7*(n==125);
end
 
function n=nN(N)
n=N.*(N>=1&N<=10)+10*(N>=11&N<=50)+13*(N<=99&N>=51)+50*(N<=500 & N>=100)+80*(N<=3200&N>=501)+125*(N>3200);
end
 
function c=cN(N)
c=cn(nN(N));
end
