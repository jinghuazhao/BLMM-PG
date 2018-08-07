# Mixed-Models

**Mixed models with polygenci effects**

Seeded from a GAW14 contributing paper, 

> Zhao JH (2005). [Mixed-effects Cox models of alcohol dependence in extended families](https://doi.org/10.1186/1471-2156-6-S1-S127), BMC Genetics 6 (Suppl 1) :S127, 

this repository is on several aspects (**in subdirectories**) of the models:

1. Mixed modeling with whole genome data (**[JPS](JPS)**) provides an overview and is derived from work on analysis of family data where relationship between relatives is commonly 
used and recently mirrored in population-based samples with a genomic relationship matrix (GRM) from whole genome genotypes. The work was motivated by the S-Plus package 
[kinship](http://www.mayo.edu/research/departments-divisions/department-health-sciences-research/division-biomedical-statistics-informatics/software/s-plus-r-functions), ported to 
R for genetic analysis workshop 14 (GAW14) as reported in [a paper](https://bmcgenet.biomedcentral.com/articles/10.1186/1471-2156-6-S1-S127) in 2005.

2. Bayesian linear mixed model with polygenic effects (**[JSS](JSS)**) adds Bayesian implementation using software such as [OpenBUGS](http://openbugs.net/w/FrontPage), 
[JAGS](http://mcmc-jags.sourceforge.net/) and [Stan](http://mc-stan.org/) plus specialised software initially developed for plant genetics.

3. GxE interaction (**[GxE](GxE)**) is considered via both frequentist and Bayesian approaches above.

They have generic implications in assessment of SNP-trait association including risk prediction and Mendelian randomisation analysis, given that increasing number of variants are 
identified but with inter-popuation fluctuations. These variants are often used collectively as polygenic risk scores.
