echo "This script takes roughly half an hour to run (test time: ?)"

# Activate virtualenv containing pytorch 0.4.0 and opencv, etc.
echo "Activating conda env."
source activate pytorch0.4.0

GPU_ID=1
SESSION=1
EPOCH=20
CHECKPOINT=39
echo "Run test_net.py"
CUDA_VISIBLE_DEVICES=$GPU_ID python test_net.py --dataset lofar --net vgg16 \
                   --checksession $SESSION --checkepoch $EPOCH --checkpoint $CHECKPOINT \
                                      --cuda

echo "Deactivating conda env."
conda deactivate
