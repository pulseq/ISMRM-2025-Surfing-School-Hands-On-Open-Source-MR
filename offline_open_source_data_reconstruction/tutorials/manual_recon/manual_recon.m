load gre2d_rawdata.mat ;
im = ifftshift(ifft2(ifftshift(gre2d_rawdata))) ;
% figure ;
% montage(mat2gray(abs(im))) ;
% title('recon images (all coils)') ;
im_rss = rssq(im, 3) ;
figure ;
imshow(squeeze(im_rss),[]) ;
exportgraphics(gcf,'manual_recon_img.png',...
    'ContentType','vector',...
    'BackgroundColor','none') ;