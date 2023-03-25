#!/bin/bash
# Train and test models with fastText

# $1: directory of the datasets
# $2: train/test suffix (empty or _scr)
echo "Training the model..." $1 $2
./fastText-0.9.2/fasttext  supervised -input $1/train$2.txt -output models/KLID_model$2 -dim 64 -minn 2 -maxn 6 -loss hs -epoch 25 -lr 1.0


echo "Compressing..."
./fastText-0.9.2/fasttext quantize -input $1/train$2.txt -output models/KLID_model$2 -qnorm -cutoff 50000 -retrain

echo "Testing the model..."
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/test$2.txt
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/test$2.txt 2
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/test$2.txt 3
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/test$2.txt 4

if [[ $2!="_scr" ]] 
then
	echo "Testing with lid.176..."
	./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/test$2.txt
	./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/test$2.txt 2
	./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/test$2.txt 3
	./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/test$2.txt 4
fi

./fastText-0.9.2/fasttext predict models/KLID_model$2.bin $1/test$2.txt 4 > models/predict$2.txt
./fastText-0.9.2/fasttext predict fastText-0.9.2/lid.176.bin $1/test$2.txt 4 > models/predict_lid.176$2.txt
echo "Prediction done."

echo "Testing and predicting unconventional dataset with the trained model"
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/SouthernKurdish-arab_test_unconventional.txt
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/SouthernKurdish-arab_test_unconventional.txt 2
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/SouthernKurdish-arab_test_unconventional.txt 3
./fastText-0.9.2/fasttext test models/KLID_model$2.bin $1/SouthernKurdish-arab_test_unconventional.txt 4
echo "Testing and predicting unconventional dataset with lid.176"
./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/SouthernKurdish-arab_test_unconventional.txt
./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/SouthernKurdish-arab_test_unconventional.txt 2
./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/SouthernKurdish-arab_test_unconventional.txt 3
./fastText-0.9.2/fasttext test fastText-0.9.2/lid.176.bin $1/SouthernKurdish-arab_test_unconventional.txt 4

./fastText-0.9.2/fasttext predict models/KLID_model$2.bin $1/SouthernKurdish-arab_test_unconventional.txt 4 > models/predict$2_sdh_unconventional.txt
./fastText-0.9.2/fasttext predict fastText-0.9.2/lid.176.bin $1/SouthernKurdish-arab_test_unconventional.txt 4 > models/predict_lid.176_sdh_unconventional.txt

echo "Done."