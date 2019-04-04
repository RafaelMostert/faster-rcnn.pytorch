# Activate virtualenv containing pytorch 0.4.0 and opencv, etc.
echo "Activating conda env."
source activate pytorch0.4.0

GPU_ID=7
SESSION=1
EPOCH=1
CHECKPOINT=2504

echo "Run demo.py"
CUDA_VISIBLE_DEVICES=$GPU_ID python demo.py --net vgg16 \
                   --checksession $SESSION --checkepoch $EPOCH --checkpoint $CHECKPOINT \
                   --cuda --image_dir images/variable_size_cutouts --load_dir models

echo "Deactivating conda env."
conda deactivate
