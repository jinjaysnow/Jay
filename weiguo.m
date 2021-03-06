% 方法一，直接绘图，求1000个点的最大最小值
% x1 = 3:0.7*0.01:3+0.7*0.01*1000;
% x2 = 7:0.714*0.01:7+0.714*0.01*1000;
% S = [0.7 0.714];
% f = x1.^5 + x2.^4 -5*x1.^4+30*x2.^3 +25*x1.^3+10*x2.^2+x1.*x2 - 10*x1 - 14*x2 + 30;
% scatter3(x1,x2,f)
% [d ind] = sort(f,'descend')
% min(f)
% max(f)


% 方法二，流程图法
x = [3 7]';
S = [0.7 0.714]';
f2 = x(1)^5 + x(2)^4 -5*x(1)^4+30*x(2)^3 +25*x(1)^3+10*x(2)^2+x(1)*x(2) - 10*x(1) - 14*x(2) + 30;
ak = 0.01;
a = ak;
a1 = 0;
a2 = 0;
a3 = 0;
f2 = 0;
f3 = 0;
while 1
	a1 = a2 + a;
	x = x + a1 * S;
	f1 = x(1)^5 + x(2)^4 -5*x(1)^4+30*x(2)^3 +25*x(1)^3+10*x(2)^2+x(1)*x(2) - 10*x(1) - 14*x(2) + 30;
	if f1 > f2
		if a == ak
			a3 = a1;
			f3 = f1;
			a = 0 - a;
			continue;
		else
			if a1 > a3
				S = a1;f = f1;
				a1 = a3;f1 = f3;
				a2 = S;f3 = f;
				break;
			else
				break
			end	
		end
	else
		a3 = a2;f3 = f2;
		a2 = a1;f2 = f1;
		a = 2 * a;
	end
end

a1,a2,a3
f1,f2,f3