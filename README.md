
# WithinPairMining
Please follow the instruction to reproduce my expriments. Note that this project is based on [Powerful_benchmark](https://kevinmusgrave.github.io/powerful-benchmarker/).

## Installation
### Library
    torch >= 1.2
    pip install tensorboard    
    pip install scikit-learn    
    pip install matplotlib 
    pip install pandas  
    pip install ax-platform  
    pip install faiss-gpu
    pip install gdown
    pip install tqdm
    pip install munch
    pip install scipy
    pip install torchvision
### Prepare Dataset 

 - You can download CUB2011 from  [CUB2011](http://www.vision.caltech.edu/visipedia/CUB-200-2011.html).
   Please extract the dataset to `data/cub2011/`
   
 - You can download Cars196 from [Cars196](https://ai.stanford.edu/~jkrause/cars/car_dataset.html).
   Please extract the dataset to `data/cars196/`

## Run
### CUB2011
####  Example: Multi-similarity Loss

    # Train the model
    python run.py \
    --reproduce_results exp_configs/cub_ms \
    --experiment_name cub_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}}
    
    # Evaluation
    python run.py \
    --reproduce_results exp_configs/cub_ms \
    --experiment_name cub_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --splits_to_eval [test] \
    --evaluate_ensemble
    
    python run.py \
    --reproduce_results exp_configs/cub_ms \
    --experiment_name cub_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --splits_to_eval [test] \
    --evaluate

For other loss functions, you can replace the config file path in `--reproduce_results`. The alternatives are `exp_configs/cub_triplet`, `exp_configs/cub_contrast`, `exp_configs/cub_margin`.

### Cars196
####  Example: Multi-similarity Loss
    # Train the model
    python run.py \
    --reproduce_results exp_configs/car_ms \
    --experiment_name car_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --config_dataset [default, with_cars196] \
	--config_general [default, with_cars196] 
    
    # Evaluation
    python run.py \
    --reproduce_results exp_configs/car_ms \
    --experiment_name car_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --config_dataset [default, with_cars196] \
	--config_general [default, with_cars196] \
    --splits_to_eval [test] \
    --evaluate_ensemble
    
    python run.py \
    --reproduce_results exp_configs/car_ms \
    --experiment_name car_ms \
    --merge_argparse_when_resuming \
    --split_manager~SWAP~1 {MLRCSplitManager: {}} \
    --config_dataset [default, with_cars196] \
	--config_general [default, with_cars196] \
    --splits_to_eval [test] \
    --evaluate
For other loss functions, you can replace the config file path in `--reproduce_results`. The alternatives are `exp_configs/car_triplet`, `exp_configs/car_contrast`, `exp_configs/car_margin`.

## Trained Models
We release our trained models in this table, please download the checkpoints from [Trained Models](https://drive.google.com/drive/folders/17OTN1rprnRk2eazJ-Xspl4_jiAdC4t_G?usp=sharing). 
|                      | CUB2011                       |                      |                                |                             |                         |                        | Car196                        |                         |                         |                            |                        |                        |
| :------------------: | :---------------------------: | :------------------: | :----------------------------: | :-------------------------: | :---------------------: | :--------------------: | :---------------------------: | :---------------------: | :---------------------: | :------------------------: | :--------------------: | :--------------------: |
|                      | Concatenated <br>  (512 dim)  |                      |                                | Separated <br>   (128-dim)  |                         |                        | Concatenated <br>  (512-dim)  |                         |                         | Separated <br>  (128-dim)  |                        |                        |
|                      | P@1                           | RP                   | MAP@R                          | P@1                         | RP                      | MAP@R                  | P@1                           | RP                      | MAP@R                   | P@1                        | RP                     | MAP@R                  |
| Pretrained           | 51\.05                        | 24\.85               | 14\.21                         | 50\.54                      | 25\.12                  | 14\.53                 | 46\.89                        | 13\.77                  | 5\.91                   | 43\.27                     | 13\.37                 | 5\.64                  |
| NT-Xent~             | 66\.61                        | 35\.96               | 25\.09                         | 58\.12                      | 30\.81                  | 19\.87                 | 80\.99                        | 34\.96                  | 24\.40                  | 68\.16                     | 27\.66                 | 16\.78                 |
| ProxyNCA~            | 65\.69                        | 35\.14               | 24\.21                         | 57\.88                      | 30\.16                  | 19\.32                 | 83\.56                        | 35\.62                  | 25\.38                  | 73\.46                     | 28\.90                 | 18\.29                 |
| Margin/class~        | 64\.37                        | 34\.59               | 23\.71                         | 55\.56                      | 29\.32                  | 18\.51                 | 80\.04                        | 33\.78                  | 23\.11                  | 67\.54                     | 26\.68                 | 15\.88                 |
| N. Softmax~          | 65\.65                        | 35\.99               | 25\.25                         | 58\.75                      | 31\.75                  | 20\.96                 | 83\.16                        | 36\.20                  | 26\.00                  | 72\.55                     | 29\.35                 | 18\.73                 |
| CosFace~             | 67\.32                        | 37\.49               | 26\.70                         | 59\.63                      | 31\.99                  | 21\.21                 | 85\.52                        | 37\.32                  | 27\.57                  | 74\.67                     | 29\.01                 | 18\.80                 |
| ArcFace~             | 67\.50                        | 37\.31               | 26\.45                         | 60\.17                      | 32\.37                  | 21\.49                 | 85\.44                        | 37\.02                  | 27\.22                  | 72\.10                     | 27\.29                 | 17\.11                 |
| FastAP~              | 63\.17                        | 34\.20               | 23\.53                         | 55\.58                      | 29\.72                  | 19\.09                 | 78\.45                        | 33\.61                  | 23\.14                  | 65\.08                     | 26\.59                 | 15\.94                 |
| SNR~                 | 66\.44                        | 36\.56               | 25\.75                         | 58\.06                      | 31\.21                  | 20\.43                 | 82\.02                        | 35\.22                  | 25\.03                  | 69\.69                     | 27\.55                 | 17\.13                 |
| MS+Miner~            | 67\.73                        | 37\.37               | 26\.52                         | 59\.41                      | 31\.93                  | 21\.01                 | 83\.67                        | 37\.08                  | 27\.01                  | 71\.80                     | 29\.44                 | 18\.86                 |
| SoftTriplet~         | 67\.27                        | 37\.34               | 26\.51                         | 59\.94                      | 32\.12                  | 21\.31                 | 84\.49                        | 37\.03                  | 27\.08                  | 73\.69                     | 29\.29                 | 18\.89                 |
| Contrast~            | 68\.13                        | 37\.24               | 26\.53                         | 59\.73                      | 31\.98                  | 21\.18                 | 81\.87                        | 35\.11                  | 24\.89                  | 69\.80                     | 27\.78                 | 17\.24                 |
| **+ Ours**           | **68\.96**                    | **37\.60**           | **26\.88**                     | **60\.24**                  | **32\.54**              | **21\.67**             | **83\.56**                    | **36\.50**              | **26\.45**              | **73\.59**                 | **29\.77**             | **19\.31**             |
| Triplet~             | 64\.24                        | 34\.55               | 23\.69                         | 55\.76                      | 29\.55                  | 18\.75                 | 79\.13                        | 33\.71                  | 23\.02                  | 65\.68                     | 26\.67                 | 15\.82                 |
| **+ Ours**           | **65\.46**                    | **35\.00**           | **24\.20**                     | **57\.87**                  | **30\.68**              | **19\.85**             | **81\.00**                    | **34\.76**              | **24\.24**              | **69\.60**                 | **28\.25**             | **17\.30**             |
| Margin~              | 63\.60                        | 33\.94               | 23\.09                         | 54\.78                      | 28\.86                  | 18\.11                 | 81\.16                        | 34\.82                  | 24\.21                  | 68\.24                     | 27\.25                 | 16\.40                 |
| **+ Ours**           | **64\.24**                    | **34\.33**           | **23\.47**                     | **56\.50**                  | **29\.61**              | **18\.80**             | **82\.25**                    | **35\.49**              | **25\.11**              | **71\.99**                 | **28\.79**             | **18\.07**             |
| MS~                  | 65\.04                        | 35\.40               | 24\.70                         | 57\.60                      | 30\.84                  | 20\.15                 | 85\.14                        | 38\.09                  | 28\.07                  | 73\.77                     | 29\.92                 | 19\.32                 |
| **+ Ours**           | **66\.02**                    | **36\.39**           | **25\.72**                     | **59\.77**                  | **32\.09**              | **21\.39**             | **86\.66**                    | **39\.39**              | **29\.67**              | **77\.19**                 | **31\.67**             | **21\.28**             |