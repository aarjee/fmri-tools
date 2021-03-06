 function run_cc_all(input_dir_base,feat_dir_list,ROIs_dir, ROI_names,fsl_transformation,parallelize, output_dir_base)
        ROIs = strsplit(ROI_names);
        for rn=1:length(ROIs)
            ROI_name = char(ROIs(rn));
            roi_atlas = [ROIs_dir '/' ROI_name '.nii.gz' ];
            if(parallelize)
                run_cc_parallel(input_dir_base,feat_dir_list,ROI_name,[1],roi_atlas,fsl_transformation, output_dir_base);
            else
                run_cc(input_dir_base,feat_dir_list,ROI_name,[1],roi_atlas,fsl_transformation, output_dir_base);
            end
            
        end
end