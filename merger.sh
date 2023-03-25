#!/bin/bash

# merge data without script code
echo "Merging test sets..."
cat datasets/CentralKurdish-arab_test.txt | shuf | ts "__label__ckb	" > datasets/test.txt
cat datasets/CentralKurdish-latn_test.txt | shuf | ts "__label__ckb	" >> datasets/test.txt
cat datasets/Gorani-arab_test.txt | shuf | ts "__label__hac	" >> datasets/test.txt
cat datasets/NorthernKurdish-arab_test.txt | shuf | ts "__label__ku	" >> datasets/test.txt
cat datasets/NorthernKurdish-latn_test.txt | shuf | ts "__label__ku	" >> datasets/test.txt
cat datasets/SouthernKurdish-arab_test.txt | shuf | ts "__label__sdh	" >> datasets/test.txt
cat datasets/Zazaki-latn-wiki_test.txt | shuf | ts "__label__zza	" >> datasets/test.txt
cat datasets/Zazaki-latn_test.txt | shuf | ts "__label__zza	" >> datasets/test.txt
cat datasets/Arabic-arab_test.txt | shuf | ts "__label__ar	" >> datasets/test.txt
cat datasets/Persian-arab_test.txt | shuf | ts "__label__fa	" >> datasets/test.txt
cat datasets/Turkish-latn_test.txt | shuf | ts "__label__tr	" >> datasets/test.txt
echo "Merging train sets..."
cat datasets/CentralKurdish-arab_train.txt | shuf | ts "__label__ckb	" > datasets/train.txt
cat datasets/CentralKurdish-latn_train.txt | shuf | ts "__label__ckb	" >> datasets/train.txt
cat datasets/Gorani-arab_train.txt | shuf | ts "__label__hac	" >> datasets/train.txt
cat datasets/NorthernKurdish-arab_train.txt | shuf | ts "__label__ku	" >> datasets/train.txt
cat datasets/NorthernKurdish-latn_train.txt | shuf | ts "__label__ku	" >> datasets/train.txt
cat datasets/SouthernKurdish-arab_train.txt | shuf | ts "__label__sdh	" >> datasets/train.txt
cat datasets/Zazaki-latn-wiki_train.txt | shuf | ts "__label__zza	" >> datasets/train.txt
cat datasets/Zazaki-latn_train.txt | shuf | ts "__label__zza	" >> datasets/train.txt
cat datasets/Arabic-arab_train.txt | shuf | ts "__label__ar	" >> datasets/train.txt
cat datasets/Persian-arab_train.txt | shuf | ts "__label__fa	" >> datasets/train.txt
cat datasets/Turkish-latn_train.txt | shuf | ts "__label__tr	" >> datasets/train.txt

echo "Merging test sets with script..."
cat datasets/CentralKurdish-arab_test.txt | shuf | ts "__label__ckbarab	" > datasets/test_scr.txt
cat datasets/CentralKurdish-latn_test.txt | shuf | ts "__label__ckblatn	" >> datasets/test_scr.txt
cat datasets/Gorani-arab_test.txt | shuf | ts "__label__hac	" >> datasets/test_scr.txt
cat datasets/NorthernKurdish-arab_test.txt | shuf | ts "__label__kuarab	" >> datasets/test_scr.txt
cat datasets/NorthernKurdish-latn_test.txt | shuf | ts "__label__kulatn	" >> datasets/test_scr.txt
cat datasets/SouthernKurdish-arab_test.txt | shuf | ts "__label__sdh	" >> datasets/test_scr.txt
cat datasets/Zazaki-latn-wiki_test.txt | shuf | ts "__label__zzawiki	" >> datasets/test_scr.txt
cat datasets/Zazaki-latn_test.txt | shuf | ts "__label__zza	" >> datasets/test_scr.txt
cat datasets/Arabic-arab_test.txt | shuf | ts "__label__ar	" >> datasets/test_scr.txt
cat datasets/Persian-arab_test.txt | shuf | ts "__label__fa	" >> datasets/test_scr.txt
cat datasets/Turkish-latn_test.txt | shuf | ts "__label__tr	" >> datasets/test_scr.txt
echo "Merging train sets with scripts..."
cat datasets/CentralKurdish-arab_train.txt | shuf | ts "__label__ckbarab	" > datasets/train_scr.txt
cat datasets/CentralKurdish-latn_train.txt | shuf | ts "__label__ckblatn	" >> datasets/train_scr.txt
cat datasets/Gorani-arab_train.txt | shuf | ts "__label__hac	" >> datasets/train_scr.txt
cat datasets/NorthernKurdish-arab_train.txt | shuf | ts "__label__kuarab	" >> datasets/train_scr.txt
cat datasets/NorthernKurdish-latn_train.txt | shuf | ts "__label__kulatn	" >> datasets/train_scr.txt
cat datasets/SouthernKurdish-arab_train.txt | shuf | ts "__label__sdh	" >> datasets/train_scr.txt
cat datasets/Zazaki-latn-wiki_train.txt | shuf | ts "__label__zzawiki	" >> datasets/train_scr.txt
cat datasets/Zazaki-latn_train.txt  | shuf | ts "__label__zza	" >> datasets/train_scr.txt
cat datasets/Arabic-arab_train.txt | shuf | ts "__label__ar	" >> datasets/train_scr.txt
cat datasets/Persian-arab_train.txt | shuf | ts "__label__fa	" >> datasets/train_scr.txt
cat datasets/Turkish-latn_train.txt | shuf | ts "__label__tr	" >> datasets/train_scr.txt

wc -l datasets/test.txt
wc -l datasets/train.txt

wc -l datasets/test_scr.txt
wc -l datasets/train_scr.txt
