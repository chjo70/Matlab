plot_google_map('apiKey', 'AIzaSyAqwoWw8gvl9MHYpGveJxnFnNgfvOLERdI') % You only need to run this once, which will store the API key in a mat file for all future usages
lat = [37.485168456889 37.454452514694 37.453517913889]; 
lon = [126.457916259694 126.481880188111 126.423416137778]; 
plot(lon,lat,'.r','MarkerSize',20) 

latIn = [37.485168456889 37.454452514694 ]; 
lonIn = [126.457916259694 126.481880188111 ]; 
aoa = [ 256.690002 277.669983 ];

%[utm_x, utm_y, utmzone] = wgs2utm( latIn, lonIn );

draw_g_line( lonIn(1), latIn(1), aoa(1), 15000 );
draw_g_line( lonIn(2), latIn(2), aoa(2), 15000 );

% plot(126.360607, 37.464581,'.r','MarkerSize',20) 

x = geodls( [ latIn ; lonIn ]', aoa, 2 )

plot( x(1), x(2),'.b','MarkerSize',20);
grid on

x(1) = 126.46787689335474
x(2) = 37.523275525887080
plot( x(1), x(2),'.r','MarkerSize',50);

plot_google_map

