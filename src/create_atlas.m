function create_atlas(config_file, out_dir)
conf = csvread(config_file);

atlas_path = '/usr/local/fsl/data/atlases/Talairach/Talairach-labels-2mm.nii.gz';
atlas = load_untouch_nii(atlas_path);
atlas_data = atlas.img;
my_atlas_data = zeros(size(atlas_data));

%%%%%%%%%%%%%%%%%%%%%%%%%% this code is optional, remove if not needed
atlas_path_cerebellar = '/usr/local/fsl/data/atlases/Cerebellum/Cerebellum-MNIflirt-maxprob-thr50-2mm.nii.gz';
atlas_cerbellar = load_untouch_nii(atlas_path_cerebellar);
atlas_data_cerbellar = atlas_cerbellar.img;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%



cerebellum_offset = length(conf) - 28;
for i=1:length(conf)
    
    %%%%%%%%%%%%%%%%%This part of the code is optional
    if i>cerebellum_offset
        my_atlas_data(find(atlas_data_cerbellar==conf(i,1))) = conf(i,2);
        continue
    end
    %%%%%%%%%%%%%%%%%%%
    my_atlas_data(find(atlas_data==conf(i,1))) = conf(i,2);
end


my_atlas.hdr = atlas.hdr; my_atlas.img = my_atlas_data; save_nii(my_atlas, out_dir);


end