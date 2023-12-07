# prepare data
drop if income == 0 | consume == 0 | area == 0 | price == 0
drop if missing(income) | missing(consume) | missing(area) | missing(price)
gen debt = fdebt + edebt + mdebt + cdebt + obedt
gen house = area * price * bldg
gen consume = food + smoke + fuel + daily + bath + fog + nurse + hkeep + traffic + connect +phone + culture + entertainment + electric + clothes + renovation + education + gedu + straffic + trip + ltraffic + health
merge 1:1 hhid using C:\Users\user\Desktop\CHFS_insurance.dta
gen insurance = aIns + HIns + OIns

# descriptive statistics
sum income debt house price bldg consume food insurance aIns HIns OIns

# OLS multiple regression and multicollinearity
reg consume debt house
estat vif
reg income debt fdebt house
estat vif

# OLS multiple regression with interaction terms
gen VIns = 1
replace VIns = 0 if insurance == 0
gen DI = debt*insurance
reg consume debt VIns insurance DI house

# robust test
reg consume debt house
reg income debt house