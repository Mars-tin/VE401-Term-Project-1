clear;clc
n=125;
for c=0:1:8
    x=0:0.001:0.2;
    sum=0;
    for d=0:1:c
        sum=sum+(n.*x).^d.*exp(-n.*x)./factorial(d);
    end
    y=sum;
    plot(x,y,'-');
    
    hold on;
end
legend('c=0','c=1','c=2','c=3','c=4','c=5','c=6','c=7','c=8');
 
h1=line([0,0.2],[0.1,0.1],'linestyle','--');
h1.Color='red';
h2=line([0.09,0.09],[0,1],'linestyle','--');
h2.Color='red';
 
h3=line([0,0.2],[0.995,0.995],'linestyle','--');
h3.Color='black';
h4=line([0.025,0.025],[0,1],'linestyle','--');
h4.Color='black';
xlabel('\Pi');
ylabel('P[accept H_0]');