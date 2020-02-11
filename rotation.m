

p = 0;
y = pi / 2;
r = 0;

R_P = [ 1 0 0 ; 0 cos(p) -sin(p) ; 0 sin(p) cos(p) ];

R_R = [ cos(r) -sin(r) 0 ; sin(r) cos(r) 0 ; 0 0 1 ];

R_Y = [ cos(y) 0 sin(y) ; 0 1 0 ; -sin(y) 0 cos(y) ];


X = [ 1; 0; 0 ];

Y = R_P * X + R_R * X + R_Y * X

R_P * R_R * R_Y;

% 3차원 그래프 그리기
plot3( 0, 0 ,0,  'o')
%plot3( 2, 10 , 11,  'o')
% axis equal
xlabel( 'x(t)')
grid on
axis([-3 3 -3 3 -3 3]);

xl = xlim();
yl = ylim();
zl = zlim();

line(2*xl, [0,0], [0,0], 'LineWidth', 3, 'Color', 'k');
line([0,0], 2*yl, [0,0], 'LineWidth', 3, 'Color', 'k');
line([0,0], [0,0], 2*zl, 'LineWidth', 3, 'Color', 'k');

mArrow3([0 0 0],Y);

%h = mArrow3([0 0 0],[0 0 1], 'facealpha', 0.5, 'color', 'red', 'stemWidth', 0.02);
