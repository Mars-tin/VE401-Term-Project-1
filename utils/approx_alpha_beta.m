clear;clc
ret=[];
 
%{
%Hypergeomatric: \alpha
for N=[1:1:10,11:3:50,100:10:500,500:400:5000]
 
    n=nN(N);
 
r=round(0.025*N);
 
flag=0;
c_min=0;
for c=0:1:N
    sum=0;
    for d=(c+1):1:floor(min(n,r))
        sum=sum+nchoosek(r,d)*nchoosek(N-r,n-d)/nchoosek(N,n);
    end
        if sum<=0.05
            c_min=c;
            break
        end            
end
ret=[ret,c_min];
end
%}
 
 
%{
%Hypergeomatric: \beta
for N=[0:1:10,11:2:50,51:10:99,101:30:500,501:50:3200,3201:600:10000]
n=nN(N);
r=round(0.09*N);
c_max=0;
for c=10:-1:0
        sum=0;
        for d=max((n+r-N),0):1:min(c,min(n,r))
            sum=sum+nchoosek(r,d)*nchoosek(N-r,n-d)/nchoosek(N,n);
        end
            if sum<=0.1
                c_max=c;
                break
            end            
end
ret=[ret,c_max];
end
NN=[0:1:10,11:2:50,51:10:99,101:30:500,501:50:3200,3201:600:10000];
plot(NN,ret,'-');
%}
 
%{
%binomial distribution \alpha
for N=[1:1:10,11:3:50,100:10:500,500:400:5000]
n=nN(N);
r=round(0.025*N);
flag=0;
c_min=0;
for c=0:1:r
    sum=0;
    for d=0:1:c
        sum=sum+nchoosek(n,d)*0.025^d*0.975^(n-d);
    end
        if 1-sum<=0.05
            c_min=c;
            break
        end            
end
ret=[ret,c_min];
end
NN=[1:1:10,11:3:50,100:10:500,500:400:5000];
plot(NN,ret,'-');
 
%}
 
%{
%binomial: \beta
for N=[1:1:10,11:2:50,100:10:500,500:40:5000]
n=nN(N);
r=round(0.09*N);
c_max=0;
for c=10:-1:0
        sum=0;
        for d=0:1:min(c,n)
            sum=sum+nchoosek(n,d)*0.09^d*0.91^(n-d);
        end
            if sum<=0.1
                c_max=c;
                break
            end            
end
ret=[ret,c_max];
end
NN=[1:1:10,11:2:50,100:10:500,500:40:5000];
plot(NN,ret,'-');
%}
 
%{
%poisson: \alpha
for N=[1:1:10,11:2:50,100:1:500,500:1:5000]
    n=nN(N);
flag=0;
c_min=0;
r=0.025*N;
for c=0:1:N
    sum=0;
    for d=(c+1):1:floor(min(n,r))
        sum=sum+(0.025*n)^d*exp(-0.025*n)/factorial(d);
    end
        if sum<=0.05
            c_min=c;
            break
        end            
end
ret=[ret,c_min];
end
 
NN=[1:1:10,11:2:50,100:1:500,500:1:5000];
plot(NN,ret,'-');
 
%}
 
 
 
%poisson: \beta
for N=[1:1:10,11:2:50,100:1:500,500:1:5000]
n=nN(N);
r=round(0.09*N);
c_max=0;
for c=10:-1:0
        sum=0;
        for d=0:1:c
            sum=sum+(0.09*n)^d*exp(-0.09*n)/factorial(d);
        end
            if sum<=0.1
                c_max=c;
                break
            end            
end
ret=[ret,c_max];
end
NN=[1:1:10,11:2:50,100:1:500,500:1:5000];
plot(NN,ret,'-');
%}
 
 
 
 
 
function n=nN(N)
n=N.*(N>=1&N<=10)+10*(N>=11&N<=50)+13*(N<=99&N>=51)+50*(N<=500 & N>=100)+80*(N<=3200&N>=501)+125*(N>3200);
end
