conda activate tfm

CHEMPROP_RES=$HOME/scratch  #aqui li dones una variable amb un path
mkdir $CHEMPROP_RES #crees
wget http://www.bioinf.jku.at/research/lsc/index.html -O $HOME/data.tar.gz #home es una variable de la shell
#tar zwf data.tar.gz #descomprimir i creara la carpeta data

# Train
python train.py  --data_path $CHEMPROP_RES/data/R_w_D_T.csv --dataset_type classification --save_dir $CHEMPROP_RES/tox21_checkpoint

# Predict
chemprop_predict --test_path $CHEMPROP_RES/data/tox21.csv --checkpoint_dir  $CHEMPROP_RES/tox21_checkpoint --preds_path $CHEMPROP_RES/tox21_preds.csv

# Interpret
chemprop_interpret --data_path $CHEMPROP_RES/data/tox21.csv --checkpoint_dir $CHEMPROP_RES/tox21_checkpoint/fold_0