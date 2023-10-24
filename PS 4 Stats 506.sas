PROC IMPORT DATAFILE='/home/u63653190/recs2020_public_v5.csv'
OUT=recs2020
DBMS=CSV;
RUN;
proc print data=recs2020 (obs=5);
run;
proc contents data=recs2020;
run;

/* (a) */
proc sql noprint;
/* weight of each state */
create table state_weights as
select state_name, sum(NWEIGHT) as total_weight
from recs2020
group by state_name;
/* sum of weights of all states */
select sum(NWEIGHT) into :totalWeight from recs2020;
/* percentage of each state and sort */
create table state_percent as
select state_name,
total_weight / &totalWeight as percentage
from state_weights
order by percentage desc;
run;
/* print the state with the highest percentage */
proc print data=state_percent(obs=1);
run;
/* print the percentage of Michigan */
proc print data=state_percent;
where state_name = "Michigan";
run;

/* (b) */
/* get records with strictly positive value of total electricity cost */
data positive_costs;
set recs2020;
if DOLLAREL > 0;
run;
/* plot the histogram */
proc sgplot data=positive_costs;
histogram DOLLAREL;
title "Histogram of Total Electricity Cost with Strictly Positive Values";
run;

/* (c) */
/* calculate the log of total elevtricity cost */
data positive_costs;
set positive_costs;
log_DOLLAREL = log(DOLLAREL);
run;
/* plot the histogram */
proc sgplot data=positive_costs;
histogram log_DOLLAREL;
title "Histogram of Log of Total Electricity Cost";
run;

/* (d) */
/* linear regression */
proc reg data=positive_costs;
model log_DOLLAREL = TOTROOMS PRKGPLC1; /* response and predictors */
weight NWEIGHT; /* weights */
title "Linear Regression on Log of Total Electricity Cost";
10
output out=predicted_data p=predicted_log; /* get predicted data for (e) */
run;

/* (e) */
data predicted_data;
set predicted_data;
predicted_DOLLAREL = exp(predicted_log);
run;
proc sgplot data=predicted_data;
scatter x=DOLLAREL y=predicted_DOLLAREL;
xaxis label="Actual Total Electricity Cost";
yaxis label="Predicted Total Electricity Cost";
title "Scatterplot of Predicted vs Actual Total Electricity Cost";
run;