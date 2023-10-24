/* (b) */
/* import csv file */
PROC IMPORT DATAFILE='/home/u63653190/public2022.csv'
OUT=fulldata
DBMS=CSV;
RUN;
/* get some information about the data */
proc print data=fulldata (obs=5);
run;
/* select needed variables */
proc sql;
create table subsetData as
11
select CaseID, weight_pop, B3, ND2, B7_b, GH1, race_5cat, educ_4cat
from fullData;
run;
/* transformation */
proc format;
value $B3fmt
'Much worse off' = 1
'Somewhat worse off' = 2
'About the same' = 3
'Somewhat better off' = 4
'Much better off' = 5;
value $ND2fmt
'Much higher' = 1
'Somewhat higher' = 2
'About the same' = 3
'Somewhat lower' = 4
'Much lower' = 5;
value $B7_bfmt
'Poor' = 1
'Only fair' = 2
'Good' = 3
'Excellent' = 4;
value $GH1fmt
'Own your home with a mortgage or loan' = 1
'Own your home free and clear (without a mortgage or loan)' = 2
'Pay rent' = 3
'Neither own nor pay rent' = 4;
value $race_fmt
'White' = 1
'Black' = 2
'Hispanic' = 3
'Asian' = 4
'Other' = 5;
value $edu_fmt
'Less than a high school degree' = 1
12
'High school degree or GED' = 2
'Some college/technical or associates degree' = 3
"Bachelor's degree or more" = 4;
run;
data Data_trans;
set subsetData;
B3_trans = put(B3, B3fmt.);
ND2_trans = put(ND2, ND2fmt.);
B7_b_trans = put(B7_b, B7_bfmt.);
GH1_trans = put(GH1, GH1fmt.);
race_trans = put(race_5cat, race_fmt.);
educ_trans = put(educ_4cat, edu_fmt.);
run;
/* (c) */
/* export the transformed data into Stata format */
proc sql;
create table outputData as
select CaseID, weight_pop, B3_trans, ND2_trans, B7_b_trans, GH1_trans, race_trans, educ_trans
from Data_trans;
run;
proc export data=outputData
outfile="/home/u63651235/sasuser.v94/public2022.dta"
dbms=stata replace;
run;
proc print data=outputData (obs=5);
run;
proc contents data=outputData;
run;