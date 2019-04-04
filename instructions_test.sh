echo "This script takes roughly half an hour to run (test time: 1909.3049s)"

# Activate virtualenv containing pytorch 1.0 and opencv, etc.
echo "Activating conda env."
source activate pytorch0.4.0

GPU_ID=1
SESSION=1
EPOCH=1
CHECKPOINT=2504
echo "Run test_net.py"
CUDA_VISIBLE_DEVICES=$GPU_ID python test_net.py --dataset pascal_voc --net vgg16 \
                   --checksession $SESSION --checkepoch $EPOCH --checkpoint $CHECKPOINT \
                                      --cuda

echo "Deactivating conda env."
conda deactivate
