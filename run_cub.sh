
mkdir data
cd data
mkdir cub2011
cd ..
cp afs/proxy/CUB_200_2011.tgz .
tar zxvf CUB_200_2011.tgz 
cp -r CUB_200_2011 data/cub2011/


python run.py \
    --reproduce_results /root/paddlejob/workspace/env_run/exp_configs/cub_marginclass \
    --experiment_name cub_nca \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} 

python run.py \
    --reproduce_results /root/paddlejob/workspace/env_run/exp_configs/cub_marginclass \
    --experiment_name cub_nca \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --splits_to_eval [test] \
    --evaluate_ensemble 
    
python run.py \
    --reproduce_results /root/paddlejob/workspace/env_run/exp_configs/cub_marginclass \
    --experiment_name cub_nca \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --splits_to_eval [test] \
    --evaluate    
