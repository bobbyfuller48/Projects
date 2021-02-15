library(tidyverse)
library(gridExtra)
# Functions work on "outcome-of-care-measures.csv" file containing data from
# Hospital Compare web site (http://hospitalcompare.hhs.gov) run by 
# the U.S. Department of Health and Human Services. 


# Pre-conditions: None 
# Post-conditions: Function returns a tibble ("hospital_table") containing data 
# regarding hospital 30 day death rates for heart attack, heart failure,
# and pneumonia.
# Each row contains a state, a hospital within that state, a cause of death, 
# the hospital's 30 day death rate for the cause of death, how the hospital's 
# death rate ranks to other hospitals in the same state (where it ranks on  
# the list of lowest and the list of highest hospital death rates), and the 
# total number of hospitals it is being compared to in the state.
make_hospital_table <- function()
{
  # data is loaded into a dataframe from "outcome-of-care-measures.csv" file 
  hospital_table <- read_csv('outcome-of-care-measures.csv', 
                                              na = 'Not Available') 
  
  # relevant columns from dataframe are given more concise names
  names(hospital_table) <- make.names(names(hospital_table))
  
  hospital_table <- hospital_table %>% 
    rename(Hospital = Hospital.Name, 
           Heart_Attack_Death_Rate = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, 
           Heart_Failure_Death_Rate = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, 
           Pneumonia_Death_Rate = Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) 
  
  # data is made tidy
  hospital_table <- hospital_table %>% 
    
    # relevant columns are selected
    select(State, Hospital, Heart_Attack_Death_Rate, Heart_Failure_Death_Rate, 
           Pneumonia_Death_Rate) %>% 
    
    # dataframe reshaped to ensure tidiness
    gather('Heart_Failure_Death_Rate', 'Heart_Attack_Death_Rate', 
           'Pneumonia_Death_Rate', key = 'Cause_Of_Death', 
           value = 'Death_Rates_30_Day') %>% 
    
    # rows containing missing values are removed
    drop_na() %>%
    
    # table is ordered and rank columns are added
    arrange(Cause_Of_Death, State, Death_Rates_30_Day, Hospital) %>% 
    group_by(Cause_Of_Death, State) %>%
    mutate(State_Rank_Best = rank(Death_Rates_30_Day, ties.method = 'first'), 
           State_Rank_Worst = rank(desc(Death_Rates_30_Day), 
                                   ties.method = 'last'), Out_Of = n())
  
  # tibble is returned
  hospital_table
} 


# Pre-conditions: Function takes in tibble created by make_hospital_table
# Post-conditions: Function returns a view of hospital_table
view_hospital_table <- function(hospital_table) view(hospital_table) 


# Pre-conditions: The 'hospital_table' argument must be a tibble created by 
# make_hospital_table(). The 'state' argument must be a string containing the
# abbreviation of a state (i.e. 'FL' or 'TX'). The 'outcome' argument must be 
# one of three strings specifying a disease outcome: 'heart failure', 
# 'heart attack', or 'pneumonia'.

# Post-conditions: Function returns string specifying the name of the hospital 
# with the best disease outcome (the lowest 30 day mortality rate) for the 
# state and outcome inputted into the function.
best <- function(hospital_table, state, outcome)
{
  # function haults and throws an error if preconditions are not met.
  valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  death_rates <- c('Heart_Attack_Death_Rate', 'Heart_Failure_Death_Rate',
                   'Pneumonia_Death_Rate')
  
  states <- state.abb
  states <- sort(append(states, c('DC', 'GU', 'PR', 'VI')))
  death <- match(outcome, valid_outcomes, nomatch = NA)
  
  if (!state%in%states) stop('invalid state')
  
  if (is.na(death)) stop('invalid outcome')
  
  # string is returned specifying hospital in 'state' with lowest 30 day death
  # rate for 'outcome'
  best_hospital <- hospital_table %>% 
    filter(State == state, 
           Cause_Of_Death == death_rates[death], 
           State_Rank_Best == 1)
  
  best_hospital$Hospital
} 


# Pre-conditions: The 'state' argument must be a string containing the 
# abbreviation of a state (i.e. 'FL' or 'TX'). The 'outcome' argument must be 
# one of three strings specifying a disease outcome: 'heart failure', 
# 'heart attack', or 'pneumonia'. The 'num' argument must be an integer or 
# the strings 'best' or 'worst'. 

# Post-conditions: Function returns string specifying the name of the hospital 
# with the best disease outcome (the lowest 30 day mortality rate) for the 
# state and outcome inputted into the function. If 'num' is greater than
# the number of hospitals in the specified state, function returns NA.
rankhospital <- function(hospital_table, state, outcome, num = 'best')
{
  
  # function haults and throws an error if preconditions are not met.
  valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  valid_num_str <- c('best', 'worst')
  death_rates <- c('Heart_Attack_Death_Rate', 'Heart_Failure_Death_Rate',
                   'Pneumonia_Death_Rate')
  states <- state.abb
  states <- sort(append(states, c('DC', 'GU', 'PR', 'VI')))
  
  death <- match(outcome, valid_outcomes, nomatch = NA)
  
  if (!state%in%states) stop('invalid state')
  if (is.na(death)) stop('invalid outcome')
  if (!is.numeric(num) & !num%in%valid_num_str) stop('invalid num input') 
  
  rank <- ifelse(num == 'best' || num == 'worst', 1, num)
  
  # create table containing hospitals of the specified 'outcome' 
  # in the specified 'state'
  h_table <- hospital_table %>% 
    filter(State == state, Cause_Of_Death == death_rates[death])
  
  # return NA if 'num' greater than number of hospitals in 'state'
  if (num > as.numeric(h_table[1, 'Out_Of']) & !num %in% valid_num_str) 
    return(NA)
  
  # select rows of specified rank
  if (num == 'worst') 
  {
    h_table <- filter(h_table, State_Rank_Worst == rank) 
  }
  else  
  {
    h_table <- filter(h_table, State_Rank_Best == rank) 
  }
  
  # return hospital name
  h_table$Hospital
} 


# Pre-conditions: The 'hospital_table' argument must be a tibble created by 
# make_hospital_table(). The 'outcome' argument must be 
# one of three strings specifying a disease outcome: 'heart failure', 
# 'heart attack', or 'pneumonia'. The 'num' argument must be an integer or 
# the strings 'best' or 'worst'. 

# Post-conditions: Function returns a table specifying the hospitals that 
# are ranked 'num' for each 'outcome' in their respective state. If 
# 'outcome' = 'best', table specifies hospitals ranked number 1.
# If 'outcome' = 'worst', table specifies hospitals with lowest rank. 
rankall <- function(hospital_table, outcome, num = 'best')
{
  
  # function haults and throws an error if preconditions are not met.
  valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
  valid_num_str <- c('best', 'worst')
  death_rates <- c('Heart_Attack_Death_Rate', 'Heart_Failure_Death_Rate',
                   'Pneumonia_Death_Rate')
  states <- state.abb
  states <- sort(append(states, c('DC', 'GU', 'PR', 'VI')))
  
  death <- match(outcome, valid_outcomes, nomatch = NA)
  
  if (is.na(death)) stop('invalid outcome')
  if (!is.numeric(num) & !num%in%valid_num_str) stop('invalid num input') 
  
  death <- death_rates[death] 
  rank <- ifelse(num == 'best' || num == 'worst', 1, num)
  
  # create table containing hospitals of the specified rank in each state
  h_table <- hospital_table
  
  if (num == 'worst') 
  {
    h_table <- filter(h_table, State_Rank_Worst == rank, 
                      Cause_Of_Death == death)
  }
  else  
  {
    h_table <- filter(h_table, State_Rank_Best == rank, 
                      Cause_Of_Death == death)
  }
  
  # create table specifying the hospitals that are ranked 'num' for 
  # each 'outcome' in their respective state.
  modified_h_table <- tibble(hospital = NA, state = states) 
  
  for (i in 1:54) 
  {
    index <- match(states[i], unique(h_table[[1]]), nomatch = NA)
    if (!is.na(index))
      modified_h_table[[1]][[i]] <- h_table[[2]][[index]] 
    
  }
  
  # table is returned
  modified_h_table
} 


# Pre-conditions: The 'hospital_table' argument must be a tibble created by 
# make_hospital_table(). The 'state' argument must be a string containing the 
# abbreviation of a state (i.e. 'FL' or 'TX'). The 'download' argument must 
# be a logical value.

# Post-conditions: Function creates a page containing two graphs, and prints
# the page to the user's screen device. The function can also write graphs to
# a png file if 'download' parameter is assigned TRUE. The page printed 
# (or downloaded) contains a scatter plot describing the relationship between
# each hospital's pneumonia and heart attack death rates in the selected state. 
# The page also contains a bar graph displaying the average number of deaths 
# for a hospital in the specified state by outcome (heart attack, heart failure, and pneumonia). 
explore_state <- function(hospital_table, state, download = FALSE)
{
  # ensure proper input 
  states <- state.abb
  states <- sort(append(states, c('DC', 'GU', 'PR', 'VI'))) 
  
  if (!state%in%states) 
    stop('invalid state') 
  
  if (!is.logical(download)) 
    stop('invalid input for "download" - must be a logical value')
  
  # clean table to be used for both plots 
  state_df <- hospital_table %>% 
    select(Hospital, State, Cause_Of_Death, Death_Rates_30_Day) %>% 
    filter(State == state) 
  
  # clean table to be used for bar chart
  state_df_bar <- state_df %>%   
    group_by(Cause_Of_Death) %>% 
    summarise(Mean_Death_Rate = mean(Death_Rates_30_Day))
  
    state_df_bar[[1]][[1]] <- 'Heart Attack'
    state_df_bar[[1]][[2]] <- 'Heart Failure'
    state_df_bar[[1]][[3]] <- 'Pneumonia'
  
  # create bar graph
  bar <- ggplot(data = state_df_bar, 
                    aes(x = Cause_Of_Death, y = Mean_Death_Rate)) + 
    geom_bar(stat = 'identity', fill = '#9E2D2D', show.legend = FALSE, 
              width = 0.6) + 
    geom_text(aes(label=round(Mean_Death_Rate)), vjust = 1.5, size = 3.5, 
              color = 'white') +
    ggtitle(paste0('Average 30-Day Death Rate for Hospitals (',state,')')) + 
    ylab('Number Of Deaths') + 
    xlab(NULL) +
    theme_dark() + 
    theme(plot.margin = unit(c(1,1,1,1),"cm"), 
          plot.title = element_text(face = 'bold', size = 12, hjust = 0.5), 
          axis.title.y = element_text(face = 'bold', size = 10))
    
  # clean table to be used for scatter plot
  state_df_scatter <- state_df %>% 
    ungroup() %>%
    select(-State) %>% 
    group_by(Hospital) %>%      
    pivot_wider(names_from = Cause_Of_Death, values_from = Death_Rates_30_Day, 
                  values_fn = mean) %>% 
    drop_na()
    
  # compute R squared value  
  fit <- lm(Heart_Attack_Death_Rate ~ Pneumonia_Death_Rate, 
              data = state_df_scatter) 
  rsq <- round(summary(fit)$r.squared, 2)
  
  # create scatter plot   
  scatter <- ggplot(data = state_df_scatter, 
                  aes(x = Heart_Attack_Death_Rate, 
                      y = Pneumonia_Death_Rate)) + 
    geom_point(color = '#9E2D2D') + 
    geom_smooth(method = lm, se = FALSE, formula = 'y ~ x', color = 'white') +
    annotate('text', label = paste('italic(R^2) ==', rsq), size = 4, 
             x = -Inf, y = Inf, hjust = -0.5, vjust = 2, parse = TRUE, color = 'white') + 
    ggtitle(
      paste0('Pneumonia vs. Heart Attack (',state,')')) + 
      xlab('Heart Attack Deaths (30 Days)') + 
      ylab('Pneumonia Deaths (30 Days)') + 
      theme_dark() + 
      theme(plot.margin = unit(c(1,1,1,1),"cm"), 
            plot.title = element_text(face = 'bold', size = 12, hjust = 0.5), 
            axis.title.y = element_text(face = 'bold', size = 10), 
            axis.title.x = element_text(face = 'bold', size = 10))
  
  # place both graphs on same page  
  grid.arrange(scatter, bar) 
  
  # write graphs to png file if specified by user  
  if (download)
  {
    dev.copy(png, file = paste0('hospital_death_rate','(',state,')','.png'))
    dev.off()
  }
} 
