# DGCNet

## Installing DGCNet

GapPredict uses Python3.6 and packages outlined in requirements.txt. These packages can be quickly installed by running:

`pip install -r requirements.txt`

or

`python -m pip install -r requirements.txt`

In order to train models and predict efficiently, a GPU is mandatory. Steps to install CUDA and cuDNN are available at the following links:

* CUDA: https://docs.nvidia.com/cuda/index.html
* cuDNN: https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html


## Gap Prediction With DGCNet
To run DGCNet, navigate to the `scripts/5_model_training` directory and call:

`./traingaps.sh <DGCNet lib directory>/GapPredict.py <fixed path> <unfixed path> <out dir path> <fixed start id>  <unfixed start id>`




## Citations
1.	G. S. C. Slater and E. Birney. “Automated generation of heuristics for biological sequence comparison BMC Bioinform. Bioinform., vol. 6, no. 31, Feb. 2005.
2.	J. Chu, H. Mohamadi, E. Erhan, J. Tse, R. Chiu, S. Yeo, and I. Birol. “Improving on hash-based probabilistic sequence classification using multiple spaced seeds and multi-index Bloom filters”, bioRxiv:434795, Oct. 2018.
3.  D. Paulino, R. L. Warren, B. P. Vandervalk, A. Raymond, S. D. Jackman, and I. Birol. “Sealer: a scalable gap closing application for finishing draft genomes", BMC Bioinform., vol. 16, no. 230, Jul. 2015.
4.  E. Chen, J. Chu, J. Zhang, R. L. Warren, I. Birol. "GapPredict - A Language Model for Resolving Gaps in Draft Genome Assemblies", _IEEE/ACM Transactions on Computational Biology and Bioinformatics_. [doi:10.1109/TCBB.2021.3109557](http://dx.doi.org/10.1109/TCBB.2021.3109557)
