```stata
. cd C:\Users\user\Desktop
C:\Users\user\Desktop

. 
. clear all

. 
. import delimited "cars.csv", encoding(UTF-8)
(18 vars, 5,076 obs)

. 
. rename dimensionsheight height

. 
. rename dimensionslength length

. 
. rename dimensionswidth width

. 
. rename engineinformationdriveline driveline

. 
. rename engineinformationenginetype enginetype

. 
. rename engineinformationhybrid hybrid

. 
. rename engineinformationnumberofforward numberofforward

. 
. rename engineinformationtransmission transmission

. 
. rename fuelinformationcitympg citympg

. 
. rename fuelinformationfueltype fueltype

. 
. rename fuelinformationhighwaympg highwaympg

. 
. rename identificationclassification classification

. 
. rename identificationid id

. 
. rename identificationmake make

. 
. rename identificationmodelyear modelyear

. 
. rename identificationyear year

. 
. rename engineinformationenginestatistic horsepower

. 
. rename v18 torque

. 
. keep if fueltype == "Gasoline"
(485 observations deleted)

. 
. regress highwaympg horsepower torque height length width i.year

      Source |       SS           df       MS      Number of obs   =     4,591
-------------+----------------------------------   F(8, 4582)      =    413.35
       Model |  70043.6695         8  8755.45869   Prob > F        =    0.0000
    Residual |   97055.298     4,582  21.1818634   R-squared       =    0.4192
-------------+----------------------------------   Adj R-squared   =    0.4182
       Total |  167098.968     4,590  36.4050038   Root MSE        =    4.6024

------------------------------------------------------------------------------
  highwaympg | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
  horsepower |   .0163556   .0022772     7.18   0.000     .0118913      .02082
      torque |  -.0507425    .002203   -23.03   0.000    -.0550614   -.0464236
      height |   .0099079   .0011267     8.79   0.000      .007699    .0121168
      length |    .001729   .0008836     1.96   0.050    -3.36e-06    .0034613
       width |  -.0003343   .0009045    -0.37   0.712    -.0021075    .0014388
             |
        year |
       2010  |  -.4539681   .6768246    -0.67   0.502     -1.78087    .8729342
       2011  |   .1711016   .6757043     0.25   0.800    -1.153604    1.495808
       2012  |   1.302928   .6810076     1.91   0.056    -.0321751    2.638031
             |
       _cons |   32.29266   .7225982    44.69   0.000     30.87602     33.7093
------------------------------------------------------------------------------

. 
. regress highwaympg c.horsepower##c.torque c.length c.width c.height i.year

      Source |       SS           df       MS      Number of obs   =     4,591
-------------+----------------------------------   F(9, 4581)      =    480.07
       Model |  81105.8715         9  9011.76351   Prob > F        =    0.0000
    Residual |   85993.096     4,581  18.7716865   R-squared       =    0.4854
-------------+----------------------------------   Adj R-squared   =    0.4844
       Total |  167098.968     4,590  36.4050038   Root MSE        =    4.3326

---------------------------------------------------------------------------------------
           highwaympg | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
----------------------+----------------------------------------------------------------
           horsepower |  -.0166633   .0025388    -6.56   0.000    -.0216406    -.011686
               torque |  -.0860593   .0025333   -33.97   0.000    -.0910257   -.0810928
                      |
c.horsepower#c.torque |   .0001124   4.63e-06    24.28   0.000     .0001033    .0001214
                      |
               length |   .0017767   .0008318     2.14   0.033     .0001459    .0034075
                width |  -.0011694   .0008521    -1.37   0.170      -.00284    .0005011
               height |   .0065604   .0010696     6.13   0.000     .0044634    .0086573
                      |
                 year |
                2010  |  -.5627858   .6371716    -0.88   0.377    -1.811949    .6863777
                2011  |   .0725356   .6361142     0.11   0.909    -1.174555    1.319626
                2012  |   1.197033   .6411085     1.87   0.062    -.0598488    2.453915
                      |
                _cons |   42.18795   .7930274    53.20   0.000     40.63323    43.74266
---------------------------------------------------------------------------------------

. 
. summarize(horsepower)

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  horsepower |      4,591    267.4659    97.43199        100        638

. 
. summarize(torque)

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      torque |      4,591    267.2196    101.3269         98        774

. interactplot, reverse
invalid line in style file anglestyle-ninety:
*label "90 degrees"
invalid line in style file anglestyle-ninety:
*label "90 degrees"

```
