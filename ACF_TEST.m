hhhh
121212121


disp('ACF ¿¬»ê½Ä')
clear all

%% dtoa = xlsread( 'acf_data.xlsx', 'B:B' );
toa = xlsread( 'acf_data.xlsx', 'A:A' );

size_toa = size(toa,1);

for i=1:1:size_toa-1;
    dtoa(i) = toa(i+1) - toa(i)
end
dtoa(i+1) = 0;

%% acf(x,20)

auto_x = autocorr(dtoa, size_toa-2 );

figure
y = ones( size_toa, 1 );
plot(toa, dtoa,'-*')

figure
plot(auto_x,'-*')

%%figure
%%plot(auto_x,'-*')