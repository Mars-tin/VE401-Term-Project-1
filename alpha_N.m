clear;clc

%{
%poisson
ret=[];
 
 for n=[10,13,50,80,125]
 c=cn(n);
 sum=0;
     for d=c:1:n
         sum=sum+(n*0.025)^d*exp(-n*0.025)/factorial(d);
     end
    ret=[ret,sum];
 end
%}

%{
%binomial
ret=[];
 for n=[10,13,50,80,125]
 c=cn(n);
 sum=0;
     for d=c:1:n
         sum=sum+nchoosek(n,d)*0.025^d*0.975^(n-d);
     end
    ret=[ret,sum];
 end
 %}

%hypergeometric
ret=[];
NN=[0:1:10,11:2:50,100:10:500,500:40:5000];
for N=[0:1:10,11:2:50,100:10:500,500:40:5000]
 n=nN(N);
 r=round(0.025*N);
 c=cn(n);
 sum=0;
     for d=c:1:floor(min(n,r))
         sum=sum+nchoosek(r,d)*nchoosek(N-r,n-d)/nchoosek(N,n);
     end
    ret=[ret,sum];
end
 plot(NN,ret,'-');
 
 
function c=cn(n)
c=0*(n==10)+1*(n==13)+3*(n==50)+5*(n==80)+7*(n==125);
end

function n=nN(N)
n=N.*(N>=1&N<=10)+10*(N>=11&N<=50)+13*(N<=99&N>=51)+50*(N<=500 & N>=100)+80*(N<=3200&N>=501)+125*(N>3200);
end

function c=cN(N)
c=cn(nN(N));
end