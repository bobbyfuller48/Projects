Function examples
=================

make\_hospital\_table()
-----------------------

``` r
source('Hospital_Compare_Functions.R')
hospitals <- make_hospital_table()
head(hospitals) 
```

    ## # A tibble: 6 x 7
    ## # Groups:   Cause_Of_Death, State [2]
    ##   State Hospital Cause_Of_Death Death_Rates_30_… State_Rank_Best
    ##   <chr> <chr>    <chr>                     <dbl>           <int>
    ## 1 AK    PROVIDE… Heart_Attack_…             13.4               1
    ## 2 AK    ALASKA … Heart_Attack_…             14.5               2
    ## 3 AK    FAIRBAN… Heart_Attack_…             15.5               3
    ## 4 AK    ALASKA … Heart_Attack_…             15.7               4
    ## 5 AK    MAT-SU … Heart_Attack_…             17.7               5
    ## 6 AL    CRESTWO… Heart_Attack_…             13.3               1
    ## # … with 2 more variables: State_Rank_Worst <int>, Out_Of <int>

``` r
tail(hospitals)
```

    ## # A tibble: 6 x 7
    ## # Groups:   Cause_Of_Death, State [1]
    ##   State Hospital Cause_Of_Death Death_Rates_30_… State_Rank_Best
    ##   <chr> <chr>    <chr>                     <dbl>           <int>
    ## 1 WY    MEMORIA… Pneumonia_Dea…             13.5              19
    ## 2 WY    SHERIDA… Pneumonia_Dea…             13.5              20
    ## 3 WY    HOT SPR… Pneumonia_Dea…             14.3              21
    ## 4 WY    POWELL … Pneumonia_Dea…             14.3              22
    ## 5 WY    WESTON … Pneumonia_Dea…             15.4              23
    ## 6 WY    NORTH B… Pneumonia_Dea…             17.3              24
    ## # … with 2 more variables: State_Rank_Worst <int>, Out_Of <int>

explore\_state(hospital\_table, state, download = FALSE)
--------------------------------------------------------

``` r
explore_state(hospitals, 'FL') 
```

<img src="Function-Examples_files/figure-markdown_github/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

``` r
explore_state(hospitals, 'GA')  
```

<img src="Function-Examples_files/figure-markdown_github/unnamed-chunk-2-2.png" style="display: block; margin: auto;" />

best(hospital\_table, state, outcome)
-------------------------------------

``` r
best(hospitals, 'FL', 'heart attack') 
```

    ## [1] "MOUNT SINAI MEDICAL CENTER"

``` r
best(hospitals, 'FL', 'heart failure')
```

    ## [1] "FLORIDA HOSPITAL HEARTLAND MEDICAL CENTER"

``` r
best(hospitals, 'FL', 'pneumonia')
```

    ## [1] "MOUNT SINAI MEDICAL CENTER"

``` r
best(hospitals, 'GA', 'heart failure')
```

    ## [1] "DOCTORS HOSPITAL"

rankhospital(hospital\_table, state, outcome, num = ‘best’)
-----------------------------------------------------------

``` r
rankhospital(hospitals, 'FL', 'heart attack', 'best') 
```

    ## [1] "MOUNT SINAI MEDICAL CENTER"

``` r
rankhospital(hospitals, 'FL', 'heart attack', 'worst')
```

    ## [1] "PALMETTO GENERAL HOSPITAL"

``` r
rankhospital(hospitals, 'FL', 'pneumonia', 5) 
```

    ## [1] "FLAGLER HOSPITAL"

rankall(hospital\_table, outcome, num = ‘best’)
-----------------------------------------------

``` r
rankall(hospitals, 'heart attack', 'best') 
```

    ## # A tibble: 54 x 2
    ##    hospital                             state
    ##    <chr>                                <chr>
    ##  1 PROVIDENCE ALASKA MEDICAL CENTER     AK   
    ##  2 CRESTWOOD MEDICAL CENTER             AL   
    ##  3 ARKANSAS HEART HOSPITAL              AR   
    ##  4 MAYO CLINIC HOSPITAL                 AZ   
    ##  5 GLENDALE ADVENTIST MEDICAL CENTER    CA   
    ##  6 ST MARYS HOSPITAL AND MEDICAL CENTER CO   
    ##  7 WATERBURY HOSPITAL                   CT   
    ##  8 PROVIDENCE HOSPITAL                  DC   
    ##  9 BAYHEALTH - KENT GENERAL HOSPITAL    DE   
    ## 10 MOUNT SINAI MEDICAL CENTER           FL   
    ## # … with 44 more rows

``` r
rankall(hospitals, 'pneumonia', 'worst')
```

    ## # A tibble: 54 x 2
    ##    hospital                              state
    ##    <chr>                                 <chr>
    ##  1 ALASKA NATIVE MEDICAL CENTER          AK   
    ##  2 JACKSONVILLE MEDICAL CENTER           AL   
    ##  3 RIVER VALLEY MEDICAL CENTER           AR   
    ##  4 HAVASU REGIONAL MEDICAL CENTER        AZ   
    ##  5 DELANO REGIONAL MEDICAL CENTER        CA   
    ##  6 ST MARYS HOSPITAL AND MEDICAL CENTER  CO   
    ##  7 MILFORD HOSPITAL, INC                 CT   
    ##  8 GEORGETOWN UNIVERSITY HOSPITAL        DC   
    ##  9 CHRISTIANA CARE HEALTH SERVICES, INC. DE   
    ## 10 SEVEN RIVERS REGIONAL MEDICAL CENTER  FL   
    ## # … with 44 more rows

``` r
rankall(hospitals, 'heart failure', 2)
```

    ## # A tibble: 54 x 2
    ##    hospital                             state
    ##    <chr>                                <chr>
    ##  1 YUKON KUSKOKWIM DELTA REG HOSPITAL   AK   
    ##  2 EVERGREEN MEDICAL CENTER             AL   
    ##  3 NORTH METRO MEDICAL CENTER           AR   
    ##  4 COBRE VALLEY REGIONAL MEDICAL CENTER AZ   
    ##  5 CEDARS-SINAI MEDICAL CENTER          CA   
    ##  6 SKY RIDGE MEDICAL CENTER             CO   
    ##  7 HOSPITAL OF ST RAPHAEL               CT   
    ##  8 HOWARD UNIVERSITY HOSPITAL           DC   
    ##  9 NANTICOKE MEMORIAL HOSPITAL          DE   
    ## 10 LAKE CITY MEDICAL CENTER             FL   
    ## # … with 44 more rows
