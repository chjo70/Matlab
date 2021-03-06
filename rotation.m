

p = 0;
y = 0;
r = 0;

% roll
R_R = [ 1 0 0 ; 0 cos(r) -sin(r) ; 0 sin(r) cos(r) ];

% yaw
R_Y = [ cos(y) -sin(y) 0 ; sin(y) cos(y) 0 ; 0 0 1 ];

% pitch
R_P = [ cos(p) 0 sin(p) ; 0 1 0 ; -sin(p) 0 cos(p) ];

X = [ 1; 0; 0 ];

% Y = ( R_P * X ) + ( R_R * X ) + ( R_Y * X )

% 3차원 그래프 그리기
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

line(2*xl, [0,0], [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], 2*yl, [0,0], 'LineWidth', 3, 'Color', 'b');
line([0,0], [0,0], 2*zl, 'LineWidth', 3, 'Color', 'b');

mArrow3([0 0 0],X, 'color', 'red');

p = pi/4;
% pitch
R_P = [ cos(-p) 0 sin(-p) ; 0 1 0 ; -sin(-p) 0 cos(-p) ];

Y = R_P * X;
h = mArrow3([0 0 0],Y);

X = [ 1; 0; 0 ];
for y=0 : pi/16 : 2*pi
  % roll
  %R_R = [ 1 0 0 ; 0 cos(r) -sin(r) ; 0 sin(r) cos(r) ];

  % yaw
  R_Y = [ cos(y) -sin(y) 0 ; sin(y) cos(y) 0 ; 0 0 1 ];

  % pitch
  R_P = [ cos(-p) 0 sin(-p) ; 0 1 0 ; -sin(-p) 0 cos(-p) ];
  
  fprintf( '\n방위각(YAW)=%.1f, 고각(PITCH)=%.1f' , y * 180 / pi, p * 180/pi )

  %Y = R_R * R_P * R_Y * X;
  Y = R_P * R_Y * X;
  h = mArrow3([0 0 0],Y);
  pause(0.5)
  delete(h);
end


%for p=-pi/2 : pi/2 : pi/2
%    for y=0 : pi/16 : pi
      % roll
      %R_R = [ 1 0 0 ; 0 cos(r) -sin(r) ; 0 sin(r) cos(r) ];

      % yaw
%      R_Y = [ cos(y) -sin(y) 0 ; sin(y) cos(y) 0 ; 0 0 1 ];

      % pitch
      %R_P = [ cos(p) 0 sin(p) ; 0 1 0 ; -sin(p) 0 cos(p) ];

      %Y = R_R * R_P * R_Y * X;
%      Y = R_Y * X;
%      h = mArrow3([0 0 0],Y);
%      pause(0.5)
%      delete(h);
%    end
    
 %   X = Y;
%    for p=0 : pi/16 : pi/2
      % pitch
%      R_P = [ cos(p) 0 sin(p) ; 0 1 0 ; -sin(p) 0 cos(p) ];

%      Y = R_P * X;
%      h = mArrow3([0 0 0],Y);
%      pause(0.5)
%      delete(h);
%    end    

%end  

%h = mArrow3([0 0 0],[0 0 1], 'facealpha', 0.5, 'color', 'red', 'stemWidth', 0.02);
