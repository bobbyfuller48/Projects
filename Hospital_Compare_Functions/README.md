Repository contains functions that work on "outcome-of-care-measures.csv" file containing data from the Centers for Medicare & Medicaid Services web site (https://data.cms.gov/provider-data/?redirect=true) run by the U.S. Department of Health and Human Services. The .csv file is comprised of a table of over 4,000 Medicare certified hospitals in the USA. Data for each hospital such as the 30-day mortality rate for heart attack, heart failure, and stroke is recorded. I could not find the dates of the measurements in the file but it was posted in 2012, so it is safe to assume that the data was measured around that time. 

The table contains the following 46 fields: 
1. Provider Number: varchar (6) Lists the hospitals by their provider identification number.
2. Hospital Name: varchar (50) Lists the name of the hospital.
3. Address 1: varchar (50) Lists the first line of the street address of the hospital.
4. Address 2: varchar (50) Lists the second line of the street address of the hospital.
5. Address 3: varchar (50) Lists the third line of the street address of the hospital.
6. City: varchar (28) Lists the city in which the hospital is located.
7. State: varchar (2) Lists the 2 letter State code in which the hospital is located.
8. ZIP Code: char (5) Lists the 5 digit numeric ZIP for the hospital.
9. County Name: char (15) Lists the county in which the hospital is located.
10. Phone Number: char (10) Lists the 10-digit numeric telephone number, including area code, for the Hospital.
11. Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the risk adjusted rate (percentage) for each hospital.
12. Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Heart
Attack: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  • Better than U.S. National Average
  • No Different than U.S. National Average
  • Worse than U.S. National Average
  • Number of Cases too Small
13. Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
14. Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
15. Number of Patients - Hospital 30-Day Death (Mortality) Rates from Heart Attack: varchar (5) Lists the number of Medicare patients treated for Heart Attack by the Hospital.
16. Footnote - Hospital 30-Day Death (Mortality) Rates from Heart Attack: Lists the footnote value when appropriate, as related to the Heart Attack Outcome of Care at the hospital.
17. Hospital 30-Day Death (Mortality) Rates from Heart Failure: Lists the risk adjusted rate (percentage) for each hospital.
18. Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Heart Failure: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  a. Better than U.S. National Average
  b. No Different than U.S. National Average 
  c. Worse than U.S. National Average
  d. Number of Cases too Small
19. Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Failure: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
20. Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Heart Failure: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
21. Number of Patients - Hospital 30-Day Death (Mortality) Rates from Heart Failure: varchar (5) Lists the number of Medicare patients treated for Heart Failure by the Hospital.
22. Footnote - Hospital 30-Day Death (Mortality) Rates from Heart Failure: Lists the footnote value when appropriate, as related to the Heart Failure Outcome of Care at the hospital.
23. Hospital 30-Day Death (Mortality) Rates from Pneumonia: Lists the risk adjusted rate (percentage) for each hospital.
24. Comparison to U.S. Rate - Hospital 30-Day Death (Mortality) Rates from Pneumonia: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  • Better than U.S. National Average
  • No Different than U.S. National Average
  • Worse than U.S. National Average
  • Number of Cases too Small
25. Lower Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Pneumonia: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
26. Upper Mortality Estimate - Hospital 30-Day Death (Mortality) Rates from Pneumonia: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
27. Number of Patients - Hospital 30-Day Death (Mortality) Rates from Pneumonia: varchar (5) Lists the number of Medicare patients treated for Pneumonia by the Hospital.
28. Footnote - Hospital 30-Day Death (Mortality) Rates from Pneumonia: Lists the footnote value when appropriate, as related to the Pneumonia Outcome of Care at the hospital.
29. Hospital 30-Day Readmission Rates from Heart Attack: Lists the risk adjusted rate (percentage) for each hospital.
30. Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Heart Attack: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  • Better than U.S. National Average
  • No Different than U.S. National Average
  • Worse than U.S. National Average
  • Number of Cases too Small
32. Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Attack: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
33. Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Attack: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
34. Number of Patients - Hospital 30-Day Readmission Rates from Heart Attack: varchar (5) Lists the number of Medicare patients treated for Heart Attack.
35. Footnote - Hospital 30-Day Readmission Rates from Heart Attack: Lists the footnote value when appropriate, as related to the Heart Attack Outcome of Care at the hospital.
36. Hospital 30-Day Readmission Rates from Heart Failure: Lists the risk adjusted rate (percentage) for each hospital.
37. Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Heart Failure: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  • Better than U.S. National Average
  • No Different than U.S. National Average
  • Worse than U.S. National Average
  • Number of Cases too Small
38. Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Failure: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
39. Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Heart Failure: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
40. Number of Patients - Hospital 30-Day Readmission Rates from Heart Failure: varchar (5) Lists the number of Medicare patients treated for Heart Failure.
41. Footnote - Hospital 30-Day Readmission Rates from Heart Failure: Lists the footnote value when appropriate, as related to the Heart Failure Outcome of Care at the hospital.
42. Hospital 30-Day Readmission Rates from Pneumonia: Lists the risk adjusted rate (percentage) for each hospital.
43. Comparison to U.S. Rate - Hospital 30-Day Readmission Rates from Pneumonia: varchar (50) Lists the mortality and readmission category in which the hospital falls. The values are:
  • Better than U.S. National Average
  • No Different than U.S. National Average
  • Worse than U.S. National Average
  • Number of Cases too Small
44. Lower Readmission Estimate - Hospital 30-Day Readmission Rates from Pneumonia: Lists the lower bound (Interval Estimate) for each hospital’s risk-adjusted rate.
45. Upper Readmission Estimate - Hospital 30-Day Readmission Rates from Pneumonia: Lists the upper bound (Interval Estimate) for each hospital’s risk-adjusted rate.
46. Number of Patients - Hospital 30-Day Readmission Rates from Pneumonia: varchar (5) Lists the number of Medicare patients treated for Pneumonia.
47. Footnote - Hospital 30-Day Readmission Rates from Pneumonia: Lists the footnote value when appropriate, as related to the Pneumonia Outcome of Care at the hospital. 
************************************************************************************************************************************************************************ 
The functions contained in Hospital_Compare_Functions.R perform the following: 

1. make_hospital_table() 
  Pre-conditions: None 

  Post-conditions: Function returns a tibble ("hospital_table") containing data 
   regarding hospital 30 day death rates for heart attack, heart failure,
   and pneumonia.
   Each row contains a state, a hospital within that state, a cause of death, 
   the hospital's 30 day death rate for the cause of death, how the hospital's 
   death rate ranks to other hospitals in the same state (where it ranks on  
   the list of lowest and the list of highest hospital death rates), and the 
   total number of hospitals it is being compared to in the state. 

  The fields of a hospital_table are as follows: 
  1. State: character - lists state of hospital
  2. Hospital: character - lists hospital name
  3. Cause_Of_Death: character - lists the type of death rate. The values are: Heart_Attack_Death_Rate, Heart_Failure_Death_Rate, and Pneumonia_Death_Rate
  4. Death_Rates_30_Day: numeric - lists the risk adjusted rate (percentage) for each hospital
  5. State_Rank_Best : integer - lists how each hospital ranks in its state in terms of best outcome for a given 30_day_death_rate
  6. State_Rank_Worst : integer - lists how each hospital ranks in its state in terms of worst outcome for a given 30_day_death_rate
  7. Out_Of : integer - lists how many hospitals each hospital is being compared to for State_Rank_Best and State_Rank_Worst 

2. view_hospital_table(hospital_table) 
 -Pre-conditions: Function takes in tibble created by make_hospital_table

 -Post-conditions: Function returns a view of hospital_table 

3. best(hospital_table, state, outcome) 
  Pre-conditions: The 'hospital_table' argument must be a tibble created by 
   make_hospital_table(). The 'state' argument must be a string containing the
   abbreviation of a state (i.e. 'FL' or 'TX'). The 'outcome' argument must be 
   one of three strings specifying a disease outcome: 'heart failure','heart attack', or 'pneumonia'.

 Post-conditions: Function returns string specifying the name of the hospital 
  with the best disease outcome (the lowest 30 day mortality rate) for the 
  state and outcome inputted into the function. 

4. rankhospital(hospital_table, state, outcome, num = 'best') 
  Pre-conditions: The 'state' argument must be a string containing the 
    abbreviation of a state (i.e. 'FL' or 'TX'). The 'outcome' argument must be 
    one of three strings specifying a disease outcome: 'heart failure', 
   'heart attack', or 'pneumonia'. The 'num' argument must be an integer or 
   the strings 'best' or 'worst'. 

  Post-conditions: Function returns string specifying the name of the hospital 
   with the best disease outcome (the lowest 30 day mortality rate) for the 
   state and outcome inputted into the function. If 'num' is greater than
   the number of hospitals in the specified state, function returns NA. 

5. rankall(hospital_table, outcome, num = 'best') 
  Pre-conditions: The 'hospital_table' argument must be a tibble created by 
   make_hospital_table(). The 'outcome' argument must be 
   one of three strings specifying a disease outcome: 'heart failure','heart attack', or 'pneumonia'. 
   The 'num' argument must be an integer or 
   the strings 'best' or 'worst'. 

  Post-conditions: Function returns a table specifying the hospitals that 
   are ranked 'num' for each 'outcome' in their respective state. If 
   'outcome' = 'best', table specifies hospitals ranked number 1.
   If 'outcome' = 'worst', table specifies hospitals with lowest rank. 





