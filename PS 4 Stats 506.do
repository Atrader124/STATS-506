. doedit

. use "C:\Users\user\Desktop\public2022.dta", clear

. count
  11,667

. describe

Contains data from C:\Users\user\Desktop\public2022.dta
 Observations:        11,667                  
    Variables:             8                  
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Variable      Storage   Display    Value
    name         type    format    label      Variable label
---------------------------------------------------------------------------------------------------------------------------------------------------------------
CaseID          double  %12.0g                
weight_pop      double  %12.0g                
B3_trans        str2    %2s                   
ND2_trans       str2    %2s                   
B7_b_trans      str2    %2s                   
GH1_trans       str2    %2s                   
race_trans      str2    %2s                   
educ_trans      str2    %2s                   
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Sorted by: 

. gen B3_binary = cond(inlist(B3_trans, "1", "2"), 0, 1)

. svyset CaseID [pw = weight_pop]

Sampling weights: weight_pop
             VCE: linearized
     Single unit: missing
        Strata 1: <one>
 Sampling unit 1: CaseID
           FPC 1: <zero>

. encode ND2_trans, gen(ND2_num)

. encode B7_b_trans, gen(B7_b_num)

. encode GH1_trans, gen(GH1_num)

. encode race_trans, gen(race_num)

. encode educ_trans, gen(educ_num)

. svy: logistic B3_bin i.ND2_num i.B7_b_num i.GH1_num i.race_num i.educ_num
(running logistic on estimation sample)

Survey: Logistic regression

Number of strata =      1                        Number of obs   =      11,667
Number of PSUs   = 11,667                        Population size = 255,114,223
                                                 Design df       =      11,666
                                                 F(17, 11650)    =       57.08
                                                 Prob > F        =      0.0000

------------------------------------------------------------------------------
             |             Linearized
   B3_binary | Odds ratio   std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     ND2_num |
          2  |   1.085264   .1004103     0.88   0.377     .9052586    1.301062
          3  |   1.068285   .0911387     0.77   0.439     .9037764    1.262738
          4  |   1.298803   .2656084     1.28   0.201     .8698664    1.939252
          5  |   1.268982    .211473     1.43   0.153     .9153563    1.759224
             |
    B7_b_num |
          2  |   3.023388   .1478851    22.62   0.000     2.746971    3.327619
          3  |   6.053997   .4822353    22.61   0.000     5.178836    7.077051
          4  |   11.91989   4.109229     7.19   0.000     6.064588    23.42845
             |
     GH1_num |
          2  |    .938628   .0530243    -1.12   0.262     .8402394    1.048538
          3  |   1.025434   .0602294     0.43   0.669     .9139174    1.150559
          4  |   1.422547    .140974     3.56   0.000     1.171397    1.727545
             |
    race_num |
          2  |   2.031276   .1647816     8.74   0.000     1.732648    2.381373
          3  |   1.183977   .0847211     2.36   0.018      1.02903    1.362255
          4  |   1.562447   .1970896     3.54   0.000     1.220175    2.000729
          5  |   .9875135    .163249    -0.08   0.939     .7141897     1.36544
             |
    educ_num |
          2  |   1.119783   .1303859     0.97   0.331     .8912739     1.40688
          3  |   1.178032   .1311927     1.47   0.141     .9470055    1.465419
          4  |   1.360402     .15108     2.77   0.006     1.094276    1.691249
             |
       _cons |   .5763645   .0791819    -4.01   0.000     .4402969    .7544819
------------------------------------------------------------------------------
Note: _cons estimates baseline odds.

. export delimited "C:\Users\user\Desktop\PS 4 Stats 506 output.csv"
file C:\Users\user\Desktop\PS 4 Stats 506 output.csv saved


