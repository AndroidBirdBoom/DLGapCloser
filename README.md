# DLGapCloser Pipeline Scripts

This directory contains the scripts needed to reproduce our complete pipeline for DLGapCloser, in which we assemble a draft genome for gene genome, predict gaps with DLGapCloser, fill its gaps with Sealer, and assess how well each tool performed. The general idea of this pipeline should be applicable to any genome assembly.

Description of each folder below::

1. data(read files and homogene files)
   1. homogene(homegene files in there)
   2. read(read files in there)
   3. ref(ref files in there)
   4. data_reprocess.sh(Process the read files into the files needed by the scripts.)
2. DGCNet(view README.md)
3. prediction(prediction datas from DGCNet)
4. scripts
   1. 1_abyss_assembly(assemble gene by abyss)
   2. 2_sealer_gap_filling(gap filling by abyss)
   3. 3_flank_extraction(extract gap flanks without homogene)
   4. 3_flank_extraction_homo(extract gap flanks with homogene)
   5. 4_random_gap_sampling(gap sampling from 3.without homogene)
   6. 4_random_gap_sampling_homo(gap sampling from 3.with homogene)
   7. 5_model_training(train DGCNet by shells)
   8. 5_sealer_gap_filling(put prediction datas into abyss and reassemble gene)
   9. validateion_gaps_flanks(validate gap filling result)
