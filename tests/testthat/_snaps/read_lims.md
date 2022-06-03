# read_lims() returns expected output

    Code
      out
    Output
      # A tibble: 12 x 7
         param                             unit  rdl     value date       sample bdl  
         <chr>                             <chr> <chr>   <dbl> <date>     <chr>  <lgl>
       1 Total Lithium Solid Digestion ug~ ug/L  0.4   8.54e+2 2022-05-11 SAMPL~ FALSE
       2 Total Lithium Solid Digestion ug~ ug/L  0.4   1.01e+3 2022-05-11 SAMPL~ FALSE
       3 Total Lithium Solid Digestion ug~ ug/L  0.4   8.14e+2 2022-05-11 SAMPL~ FALSE
       4 Total Lithium Solid Digestion ug~ ug/L  0.4   4   e-1 2022-05-11 SAMPL~ TRUE 
       5 Total Sodium Solid Digestion mg/L mg/L  0.1   3.44e+0 2022-05-11 SAMPL~ FALSE
       6 Total Sodium Solid Digestion mg/L mg/L  0.1   4.28e+0 2022-05-11 SAMPL~ FALSE
       7 Total Sodium Solid Digestion mg/L mg/L  0.1   3.52e+0 2022-05-11 SAMPL~ FALSE
       8 Total Sodium Solid Digestion mg/L mg/L  0.1   2.78e-1 2022-05-11 SAMPL~ FALSE
       9 Total Magnesium Solid Digestion ~ mg/L  0.1   3.64e+1 2022-05-11 SAMPL~ FALSE
      10 Total Magnesium Solid Digestion ~ mg/L  0.1   4.37e+1 2022-05-11 SAMPL~ FALSE
      11 Total Magnesium Solid Digestion ~ mg/L  0.1   5.36e+1 2022-05-11 SAMPL~ FALSE
      12 Total Magnesium Solid Digestion ~ mg/L  0.1   1   e-1 2022-05-11 SAMPL~ TRUE 

