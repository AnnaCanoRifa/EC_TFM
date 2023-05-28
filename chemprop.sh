source $HOME/.bash_profile
conda activate tfm

CHEMPROP_RES=$HOME/scratch  #aqui li dones una variable amb un path
cp /Users/annacano/Documents/TFM/github/TFM_scripts/data/R_w_D_T.csv $CHEMPROP_RES

# Train
echo "#############################"
echo "chemprop train"
echo "#####################"
chemprop_train --data_path $CHEMPROP_RES/R_w_D_T.csv --dataset_type classification --save_dir $CHEMPROP_RES/pred_checkpoints --reaction --reaction_mode reac_prod --target_columns target --explicit_h   
echo "#############################"
echo "chemprop predict"
echo "#####################"
# Predict
chemprop_predict --test_path $CHEMPROP_RES/R_w_D_T.csv --checkpoint_dir $CHEMPROP_RES/pred_checkpoints --preds_path $CHEMPROP_RES/pred_checkpoints/preds.csv
# Interpret
echo "#############################"
echo "chemprop interpret"
echo "#####################"
chemprop_interpret --data_path $CHEMPROP_RES/R_w_D_T.csv --checkpoint_dir $CHEMPROP_RES/pred_checkpoints/fold_0
