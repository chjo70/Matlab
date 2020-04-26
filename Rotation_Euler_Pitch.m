function [A] = Rotation_Euler_Pitch( fFlightPosYaw, fFlightPosPitch, fRadarYaw, fRadarPitch, bSaveExcelFile )

% ������ �۽ű� ���� �������� �� ����
fFlightPosYaw = deg2rad(fFlightPosYaw);
fFlightPosPitch = deg2rad( fFlightPosPitch );

% ����ü�� ���̴��� �������� �� ����
fRadarPitch = deg2rad( fRadarPitch );
fRadarYaw = deg2rad( fRadarYaw );

tol = 0.00001; %eps(0.5);

% 3���� �׷��� �׸���
plot3( 0, 0 ,0,  'o')
%plot3( 2, 10 , 11,  'o')
axis equal
xlabel( 'x(t)')
ylabel( 'y(t)')
zlabel( 'z(t)')
grid on
axis([-3 3 -3 3 -3 3]);

xl = xlim();
yl = ylim();
zl = zlim();

line(3*xl, [0,0], [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], 3*yl, [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], [0,0], 3*zl, 'LineWidth', 3, 'Color', 'b');

xlabel( 'X' )
ylabel( 'Y' )
zlabel( 'Z' )

%%
R_Y = [ cos(fFlightPosYaw) -sin(fFlightPosYaw) 0 ; sin(fFlightPosYaw) cos(fFlightPosYaw) 0 ; 0 0 1 ];
R_P = [ cos(-fFlightPosPitch) 0 sin(-fFlightPosPitch) ; 0 1 0 ; -sin(-fFlightPosPitch) 0 cos(-fFlightPosPitch) ];
X = [ 3; 0; 0 ];
X = R_P * R_Y * X;
mArrow3([0 0 0], X, 'color', 'black');

% roll ���� 0 ���� �����Ѵ�.
r = 0;

% 0 ������ 180�� ����� ������/��ġ ��
p1 = deg2rad( 0 );

row = 1;

%fRadarPitch = deg2rad( 10 );
X = [ 1; 0; 0 ];
for y=0 : pi/16 : pi*2
    fprintf( '\n---------------------------------------------' )
    fprintf( '\n������(YAW)=%.1f��, ��(PITCH)=%.1f��' , y * 180 / pi, p1 * 180/pi )
    
    R_F_P = [ cos(-fFlightPosPitch) 0 sin(-fFlightPosPitch) ; 0 1 0 ; -sin(-fFlightPosPitch) 0 cos(-fFlightPosPitch) ];
    R_Y = [ cos(y) -sin(y) 0 ; sin(y) cos(y) 0 ; 0 0 1 ];
    R_F_Y = [ cos(fFlightPosYaw) -sin(fFlightPosYaw) 0 ; sin(fFlightPosYaw) cos(fFlightPosYaw) 0 ; 0 0 1 ];
    R_P_90 = [ cos( deg2rad(90) ) 0 sin( deg2rad(90) ) ; 0 1 0 ; -sin(deg2rad(90)) 0 cos(deg2rad(90)) ];
    
    % ���� ���̴� ����
    % ��
    R_R_P = [ cos(fRadarPitch) 0 sin(fRadarPitch) ; 0 1 0 ; -sin(fRadarPitch) 0 cos(fRadarPitch) ];    
    % ������
    R_R_Y = [ cos(fRadarYaw) -sin(fRadarYaw) 0 ; sin(fRadarYaw) cos(fRadarYaw) 0 ; 0 0 1 ];
    
    %Y = ( R_F_P * R_F_Y * R_P_90 * R_Y * R_R_Y * R_R_P ) * X;
    Y = ( R_F_P * R_F_Y * R_Y * R_R_Y * R_R_P ) * X;
    Y1 = [ Y(1) ; Y(2) ; Y(3) ];
    fprintf( '\n���� ���� : [%.3f, %.3f, %.3f]' , Y1(1), Y1(2), Y1(3) )
    h = mArrow3([0 0 0],Y1*2, 'color', 'red', 'stemWidth', 0.01 );
    
    % �Ǹ��� �����ڼ��� ������ �� �� ���ϱ�
    % ��
    pitch = - asin( -Y(3) );
    % ������
    
    yaw = acos( Y(1) / cos(-pitch) );
    if abs( Y(2) - sin(yaw)*cos(-pitch) ) < tol
        yaw = yaw;
    else
        yaw = -yaw;
    end
    
    Y2 = [ cos(yaw) * cos(-pitch) ; sin(yaw)*cos(-pitch) ; -sin(-pitch) ];
    %fprintf( '\n������(YAW)=%.1f��, ������(YAW)=%.1f��, ��(PITCH)=%.1f��' , rad2deg( acos( Y(1) / cos(-pitch) ) ), rad2deg( asin( Y(2) / cos(-pitch) ) ), rad2deg( pitch ) )
    fprintf( '\n������(YAW)=%.1f��, ��(PITCH)=%.1f��' , rad2deg( yaw ), rad2deg( pitch ) )
    h = mArrow3([0 0 0], real(Y2*1.5), 'color', 'green', 'stemWidth', 0.01 );
    
    Y2 = [ cos(yaw) * cos(-pitch) ; sin(yaw)*cos(-pitch) ; -sin(-pitch) ];
    fprintf( '\n��ȯ ����2(������:%.3f��) : [%.3f, %.3f, %.3f]' , rad2deg(yaw), Y2(1), Y2(2), Y2(3) )
    %h = mArrow3([0 0 0], real(Y2), 'color', 'green', 'stemWidth', 0.01 );
   
    A(row,:) = [ rad2deg(y), rad2deg(pitch), rad2deg(pitch), rad2deg(yaw), rad2deg(pitch) ];
    row = row + 1;
end    

if bSaveExcelFile == true
    filename = 'd:\testdata.xlsx';
    xlswrite(filename,A)
end

rotate3d on

fprintf( '\n\n' )

