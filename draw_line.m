function res=draw_line(lonIn, latIn, az, dist )
%distUnits = 'm';
% Convert input distance to earth degrees (Lat, Lon are typicaly given in degrees)
%arclen = rad2deg(dist/earthRadius(distUnits)); 
%[latOut,lonOut] = reckon(latIn, lonIn, arclen, az );
%res=line( [latIn, lonIn], [latOut,lonOut] );

az =  90 + az;
angle = deg2rad( az );
lonOut = lonIn - ( dist * cos( angle ) );
latOut = latIn + ( dist * sin( angle ) );

x=[lonIn, latIn];

res=line( [lonIn, lonOut], [latIn,latOut], 'Color','blue' );