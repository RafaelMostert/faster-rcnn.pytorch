# Activate virtualenv containing pytorch 0.4.0 and opencv, etc.
echo "Activating conda env."
source activate pytorch0.4.0

GPU_ID=4
SESSION=2
EPOCH=50
CHECKPOINT=196

echo "Run demo.py"
CUDA_VISIBLE_DEVICES=$GPU_ID python demo.py --net vgg16 \
                   --checksession $SESSION --checkepoch $EPOCH --checkpoint $CHECKPOINT \
                   --cuda --image_dir data/LOFARdevkittest1/LOFARtest1/DemoImages --load_dir models

echo "Deactivating conda env."
conda deactivate
