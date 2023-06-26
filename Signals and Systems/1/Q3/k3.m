%Q3 Kasra Hassani 9923107

%----------------------------------------
%clearing and closing everything
clc; clear; close all;
%----------------------------------------


                %Part A
%----------------------------------------
%making x(t) and x(-t)
syms t;
x(t)=-t+1;
xt=x(t);    %x(t)
xmt=x(-t);  %x(-t)
%----------------------------------------
%get the even and odd values then plot them
e=even(xt,xmt);
o=odd(xt,xmt);
                %plot even
%----------------------------------------
figure('WindowState','maximized');
subplot(2,1,1);
fplot(e);
title("Even:  e(t) = "+string(e));
%----------------------------------------
            
                %plot odd
%----------------------------------------
subplot(2,1,2);
fplot(o);
title("Odd:  o(t) = "+string(o));
%----------------------------------------


                %Part B
%----------------------------------------
%Square the equations
e=power(e,2);
o=power(o,2);
xt=power(xt,2);
%----------------------------------------
%taking integral
powereven=antegral(e)    %power even part
powerodd=antegral(o)     %power odd part
%----------------------------------------
%seperating (t-1)^2 values to take their integrals
cof=coeffs(xt,(t));
s1=antegral(cof(1)*(t.^2));
s2=antegral(cof(2)*t);
s3=antegral(cof(3));
powerall=s1+s2+2*s3         %power all
%----------------------------------------
%Checking if the power is equal to sum of the even and odd powers
if isequaln(powerall,powereven+powerodd)
    disp("Yes They are the same");
end


              %even function
%----------------------------------------
function [out] = even(in1,in2)
    out=(in1+in2)/2;
end
%----------------------------------------

               %odd function
%----------------------------------------
function [out] = odd(in1,in2)
    out=(in1-in2)/2;
end
%----------------------------------------

             %integral funtion
%----------------------------------------
function [out] = antegral(in1)
    syms t
    tavan=0;
    in2=in1;    %backup
    
    if (isequaln(abs(in1),sym(abs(1))) || isequaln(abs(in1),sym(abs(2))))
        tavan=0;
    end
    
     while (~isequaln(abs(in1),sym(abs(1))) && ~isequaln(abs(in1),sym(abs(2))))
         in1=in1/t;
         tavan=tavan+1;
     end
     
     in2=(in2.*power(t,tavan-1))/(tavan+1);
     if isequaln(in2,(1/t))
         out=in2*(t.^2);
     else
         out=in2;
     end
end
