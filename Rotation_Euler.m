clear

p = pi / 4;
y = pi /2;
r = 0;

% roll
R_R = [ 1 0 0 ; 0 cos(r) -sin(r) ; 0 sin(r) cos(r) ];

% yaw
R_Y = [ cos(y) -sin(y) 0 ; sin(y) cos(y) 0 ; 0 0 1 ];

% pitch
R_P = [ cos(-p) 0 sin(-p) ; 0 1 0 ; -sin(-p) 0 cos(-p) ];

% 3차원 그래프 그리기
plot3( 0, 0 ,0,  'o')
%plot3( 2, 10 , 11,  'o')
axis equal
xlabel( 'x(t)')
ylabel( 'y(t)')
zlabel( 'z(t)')
grid on
axis([-2 2 -2 2 -2 2]);

xl = xlim();
yl = ylim();
zl = zlim();

line(2*xl, [0,0], [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], 2*yl, [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], [0,0], 2*zl, 'LineWidth', 3, 'Color', 'b');

X = [ 1; 0; 0 ];
mArrow3([0 0 0],X, 'color', 'red');

% roll 값은 0 으로 가정한다.
r = 0;

% 0 도에서 180도 변경시 방위각/피치 값
%A = {'방위', '회전각', '고각' };
p1 = -10 * pi / 180;
row = 1;
for y=0 : pi/180 : pi
    fprintf( '\n---------------------------------------------' )
    fprintf( '\n방위각(YAW)=%.1f도, 고각(PITCH)=%.1f도' , y * 180 / pi, p1 * 180/pi )
    
    Y = R_P * R_Y * X;
    Y1 = [ cos(-p1) * cos(y) ; sin(y) ; -sin(-p1)*cos(y) ];
    fprintf( '\n단위 벡터 : [%.3f, %.3f, %.3f]' , Y1(1), Y1(2), Y1(3) )
    h = mArrow3([0 0 0],Y1,'color', 'red', 'stemWidth', 0.02 );
    
    p2 = - asin( sin(-p1) * cos(y) );
    y2 = acos( cos(-p1) * cos(y) / cos(-p2) );
    fprintf( '\n방위각(YAW)=%.1f도, 고각(PITCH)=%.1f도' , y2 * 180 / pi, p2 * 180/pi )
    
    Y2 = [ cos(y2) * cos(-p2) ; sin(y2)*cos(-p2) ; -sin(-p2) ];
    fprintf( '\n변환 벡터 : [%.3f, %.3f, %.3f]' , Y2(1), Y2(2), Y2(3) )
    h = mArrow3([0 0 0],Y2,'color', 'green');    
    A(row,:) = [ y*180/pi, p1*180/pi, y2*180/pi, p2*180/pi ];
    row = row + 1;
end    

% -180 도에서 0도 변경시 방위각/피치 값
for y=-pi : pi/180 : 0
    fprintf( '\n---------------------------------------------' )
    fprintf( '\n방위각(YAW)=%.1f도, 고각(PITCH)=%.1f도' , y * 180 / pi, p1 * 180/pi )
    
    Y = R_P * R_Y * X;
    Y1 = [ cos(-p1) * cos(y) ; sin(y) ; -sin(-p1)*cos(y) ];
    fprintf( '\n단위 벡터 : [%.3f, %.3f, %.3f]' , Y1(1), Y1(2), Y1(3) )
    h = mArrow3([0 0 0],Y1,'color', 'red', 'stemWidth', 0.02 );
    
    p2 = - asin( sin(-p1) * cos(y) );
    y2 = -acos( cos(-p1) * cos(y) / cos(-p2) );
    fprintf( '\n방위각(YAW)=%.1f도, 고각(PITCH)=%.1f도' , y2 * 180 / pi, p2 * 180/pi )
    
    Y2 = [ cos(y2) * cos(-p2) ; sin(y2)*cos(-p2) ; -sin(-p2) ];
    fprintf( '\n변환 벡터 : [%.3f, %.3f, %.3f]' , Y2(1), Y2(2), Y2(3) )
    h = mArrow3([0 0 0],Y2,'color', 'green'); 
    
    A(row,:) = [ y*180/pi, p1*180/pi, y2*180/pi, p2*180/pi ];
    row = row + 1;    
end    

filename = 'd:\testdata.xlsx';
xlswrite(filename,A)

fprintf( '\n' )

