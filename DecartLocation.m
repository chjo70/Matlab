


latIn = [37.485168456889 37.454452514694 37.453517913889]; 
lonIn = [126.457916259694 126.481880188111 126.423416137778]; 

plot(lon,lat,'.r','MarkerSize',20) 

%latIn = [37.485168456889 37.454452514694 ]; 
%lonIn = [126.457916259694 126.481880188111 ]; 
aoa = [ 256.690002 277.669983 ];

%
%draw_line( lonIn(1), latIn(1), 90, 1 );

% draw_line( lonIn(1), latIn(1), 360, 10 );

draw_line( lonIn(1), latIn(1), aoa(1), 10 );
draw_line( lonIn(2), latIn(2), aoa(2), 10 );

hold on

%plot(126.360607, 37.464581,'.r','MarkerSize',20) 

grid on
zoom on

x = geodls( [ latIn ; lonIn ]', aoa, 2 )

plot( x(1), x(2),'.b','MarkerSize',20);


xlabel 'x ÁÂÇ¥(km)'
ylabel 'y ÁÂÇ¥(km)'



