echo "Start train script! (test time: unknown yet)"

# Activate virtualenv containing pytorch 0.4.0 and opencv, etc.
echo "Activating conda env."
source activate pytorch0.4.0

GPU_ID=4
SESSION=2
BATCH_SIZE=4
WORKER_NUMBER=1
LEARNING_RATE=0.001
DECAY_STEP=3  # Measured in epochs, decay will possibly only take place once?
echo "Run lofar_trainval_net.py"
CUDA_VISIBLE_DEVICES=$GPU_ID python trainval_net.py \
                   --dataset lofar --net vgg16 \
                   --bs $BATCH_SIZE --nw $WORKER_NUMBER \
                   --s $SESSION \
                   --lr $LEARNING_RATE --lr_decay_step $DECAY_STEP \
                   --cuda --cag
# Note that class agnostig is set to true now

echo "Deactivating conda env."
conda deactivate
