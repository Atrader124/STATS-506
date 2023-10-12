. doedit

. import sasxport5 "C:\Users\user\Downloads\VIX_D.XPT"

. save "C:\Users\user\Downloads\VIX_D.XPT", replace
file C:\Users\user\Downloads\VIX_D.XPT saved as .dta format

. import sasxport5 "C:\Users\user\Downloads\DEMO_D.xpt"

. merge 1:1 seqn using "C:\Users\user\Downloads\VIX_D.XPT", keep(ma
> tch) nogenerate

    Result                      Number of obs
    -----------------------------------------
    Not matched                             0
    Matched                             6,980  
    -----------------------------------------

. count
  6,980

. gen age_group = "0-9" if ridageyr < 10
(6,980 missing values generated)

. replace age_group = "10-19" if ridageyr >= 10 & ridageyr < 20
variable age_group was str1 now str5
(2,207 real changes made)

. replace age_group = "20-29" if ridageyr >= 20 & ridageyr < 30
(1,021 real changes made)

. replace age_group = "30-39" if ridageyr >= 30 & ridageyr < 40
(818 real changes made)

. replace age_group = "40-49" if ridageyr >= 40 & ridageyr < 50
(815 real changes made)

. replace age_group = "50-59" if ridageyr >= 50 & ridageyr < 60
(631 real changes made)

. replace age_group = "60-69" if ridageyr >= 60 & ridageyr < 70
(661 real changes made)

. replace age_group = "70-79" if ridageyr >= 70 & ridageyr < 80
(469 real changes made)

. replace age_group = "80-89" if ridageyr >= 80 & ridageyr < 90
(358 real changes made)

. replace age_group = "90-99" if ridageyr >= 90
(0 real changes made)

. egen a=group(age_group)

. table (a) (viq220), nototals statistic(percent, across(viq220))

--------------------------------------------------------------
                 |   Glasses/contact lenses worn for distance 
                 |                     0                     1
-----------------+--------------------------------------------
group(age_group) |                                            
  1              |                 67.91                 32.09
  2              |                 67.34                 32.66
  3              |                 64.13                 35.87
  4              |                 63.00                 37.00
  5              |                 44.99                 55.01
  6              |                 37.78                 62.22
  7              |                 33.11                 66.89
  8              |                 33.12                 66.88
--------------------------------------------------------------

. replace viq220 = 0 if viq220 == 2
(3,780 real changes made)

. replace viq220 = . if viq220 == 9
(2 real changes made, 2 to missing)

. logistic viq220 ridageyr

Logistic regression                                     Number of obs =  6,545
                                                        LR chi2(1)    = 443.37
                                                        Prob > chi2   = 0.0000
Log likelihood = -4235.9433                             Pseudo R2     = 0.0497

------------------------------------------------------------------------------
      viq220 | Odds ratio   Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
    ridageyr |    1.02498   .0012356    20.47   0.000     1.022561    1.027405
       _cons |    .283379   .0151461   -23.59   0.000     .2551952    .3146755
------------------------------------------------------------------------------
Note: _cons estimates baseline odds.

.  eststo model1
command eststo is unrecognized
r(199);

. eststo model1
command eststo is unrecognized
r(199);

. ssc install estout,replace
checking estout consistency and verifying not already installed...
installing into C:\Users\user\ado\plus\...
installation complete.

. eststo model1

. estat ic

Akaike's information criterion and Bayesian information criterion

-----------------------------------------------------------------------------
       Model |          N   ll(null)  ll(model)      df        AIC        BIC
-------------+---------------------------------------------------------------
      model1 |      6,545  -4457.627  -4235.943       2   8475.887    8489.46
-----------------------------------------------------------------------------
Note: BIC uses N = number of observations. See [R] BIC note.

. logistic viq220 ridageyr i.riagendr i.ridreth1

Logistic regression                                     Number of obs =  6,545
                                                        LR chi2(6)    = 641.49
                                                        Prob > chi2   = 0.0000
Log likelihood = -4136.8805                             Pseudo R2     = 0.0720

------------------------------------------------------------------------------
      viq220 | Odds ratio   Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
    ridageyr |   1.022831   .0012912    17.88   0.000     1.020303    1.025365
  2.riagendr |    1.65217   .0875831     9.47   0.000     1.489127    1.833064
             |
    ridreth1 |
          2  |   1.169203    .192081     0.95   0.341     .8473273    1.613349
          3  |   1.952149   .1366952     9.55   0.000     1.701803    2.239322
          4  |    1.29936   .0995052     3.42   0.001     1.118264    1.509783
          5  |   1.917442   .2596352     4.81   0.000     1.470495    2.500236
             |
       _cons |   .1593479   .0124169   -23.57   0.000     .1367784    .1856414
------------------------------------------------------------------------------
Note: _cons estimates baseline odds.

. eststo model2

. estat ic

Akaike's information criterion and Bayesian information criterion

-----------------------------------------------------------------------------
       Model |          N   ll(null)  ll(model)      df        AIC        BIC
-------------+---------------------------------------------------------------
      model2 |      6,545  -4457.627   -4136.88       7   8287.761   8335.266
-----------------------------------------------------------------------------
Note: BIC uses N = number of observations. See [R] BIC note.

. logistic viq220 ridageyr i.riagendr i.ridreth1 indfmpir

Logistic regression                                     Number of obs =  6,247
                                                        LR chi2(7)    = 625.30
                                                        Prob > chi2   = 0.0000
Log likelihood = -3946.9041                             Pseudo R2     = 0.0734

------------------------------------------------------------------------------
      viq220 | Odds ratio   Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
    ridageyr |   1.022436    .001324    17.14   0.000     1.019845    1.025035
  2.riagendr |   1.675767   .0910025     9.51   0.000      1.50657    1.863967
             |
    ridreth1 |
          2  |   1.123021   .1889653     0.69   0.490     .8075333    1.561764
          3  |   1.651244   .1240886     6.67   0.000     1.425098    1.913277
          4  |   1.230456   .0974736     2.62   0.009     1.053503     1.43713
          5  |   1.703572   .2387583     3.80   0.000     1.294384    2.242114
             |
    indfmpir |   1.120301   .0198376     6.42   0.000     1.082087    1.159865
       _cons |   .1331659   .0116903   -22.97   0.000     .1121161    .1581678
------------------------------------------------------------------------------
Note: _cons estimates baseline odds.

.  eststo model3

.  esttab model1 model2 model3, eform cells(b(star fmt(3)) se(par fmt(3))) stats(N r
> 2_p aic, labels("Sample Size" "Pseudo R^2" "AIC")) mtitle("Model 1" "Model 2" "Mod
> el 3") label

--------------------------------------------------------------------
                              (1)             (2)             (3)   
                          Model 1         Model 2         Model 3   
                             b/se            b/se            b/se   
--------------------------------------------------------------------
Glasses/contact le~                                                 
Age at Screening A~R        1.025***        1.023***        1.022***
                          (0.001)         (0.001)         (0.001)   
Gender=1                                    1.000           1.000   
                                              (.)             (.)   
Gender=2                                    1.652***        1.676***
                                          (0.088)         (0.091)   
Race/Ethnicity - R~1                        1.000           1.000   
                                              (.)             (.)   
Race/Ethnicity - R~2                        1.169           1.123   
                                          (0.192)         (0.189)   
Race/Ethnicity - R~3                        1.952***        1.651***
                                          (0.137)         (0.124)   
Race/Ethnicity - R~4                        1.299***        1.230** 
                                          (0.100)         (0.097)   
Race/Ethnicity - R~5                        1.917***        1.704***
                                          (0.260)         (0.239)   
Family PIR                                                  1.120***
                                                          (0.020)   
--------------------------------------------------------------------
Sample Size              6545.000        6545.000        6247.000   
Pseudo R^2                  0.050           0.072           0.073   
AIC                      8475.887        8287.761        7909.808   
--------------------------------------------------------------------
Exponentiated coefficients

. test 2.riagendr

 ( 1)  [viq220]2.riagendr = 0

           chi2(  1) =   90.38
         Prob > chi2 =    0.0000
