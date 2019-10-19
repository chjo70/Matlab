% ��ġ ���� �˰��� �ùķ��̼�-Distance Least Square
% 2010�� 01�� 07��
% �ۼ���: ��ö��

% 

function [est_cal_xy] = geodls( sensor, aoa, to )

radian = 180 / pi;

%fprintf( 'Distance Least Square�� �̿��� ��ġ ���� �˰����Դϴ�.\n' )
%fprintf( 'Ÿ�� ��ǥ�� (%d, %d)km �̰� Ÿ�ٰ��� ���� ������ %f �Դϴ�.\n', target_xy(1)/1000, target_xy(2)/1000, aoa_mean_error*radian );
%fprintf( '����� ��ǥ�� (%d, %d)km �Դϴ�.\n', craft1(1)/1000, craft1(2)/1000 );

sumA = 0;
sumB = 0;
sumB1 = 0;
sumB2 = 0;
sumC = 0;
sumD = 0;
sumE = 0;

for i=1:1:to,
  a = sin( deg2rad(90-aoa(i)) );
  b = -cos( deg2rad(90-aoa(i)) );
  c = sensor(i,2) * a + sensor(i,1) * b;
	  
  A = a * b;
  B1 = a^2;
  B2 = b^2;
  D = ( b * c );
  E = a * c;
  
  sumA = A + sumA;
  sumB = b + sumB;
  sumB1 = B1 + sumB1;
  sumB2 = B2 + sumB2; 
  sumC = c + sumC;
  sumD = D + sumD;
  sumE = E + sumE;
  
end

x = 0;
y = 0;
divB = (sumB1 * sumB2) - sumA^2;
if( divB ~= 0 )
   x = ( (sumB2 * sumE) - (sumA * sumD ) ) / divB;
   y = ( ( sumB1 * sumD ) - (sumA * sumE) ) / divB;
end
 
est_cal_xy = [ x, y ];

% clear all
