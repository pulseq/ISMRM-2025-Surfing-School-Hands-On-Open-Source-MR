% Gadgetron recon command line: gadgetron_ismrmrd_client -f data.h5 -c default_short.xml -o data_out.h5

filename = 'data_out.h5' ;
info = hdf5info(filename) ;
address_data_1 = info.GroupHierarchy.Groups(1).Groups.Datasets(2).Name ;
im = squeeze(double( hdf5read(filename, address_data_1) ) ) ;
figure ;
montage(mat2gray(im)) ;
colormap gray ;
exportgraphics(gcf,'gadgetron_recon.png',...
    'ContentType','vector',...
    'BackgroundColor','none') ;
