# read_icp() yields expected output

    Code
      out1
    Output
      # A tibble: 1,440 x 6
         sample_name estimate_type         isotope element    value unit 
         <chr>       <chr>                 <chr>   <chr>      <dbl> <chr>
       1 Wash        Concentration average 27      Al       0.115   µg/l 
       2 Wash        Concentration average 31      P       -0.0408  µg/l 
       3 Wash        Concentration average 45      Sc      99.6     %    
       4 Wash        Concentration average 55      Mn      -0.00621 µg/l 
       5 Wash        Concentration average 56      Fe       0.0124  µg/l 
       6 Wash        Concentration average 65      Cu       0.0396  µg/l 
       7 Wash        Concentration average 115     In      99.2     %    
       8 Wash        Concentration average 159     Tb      98.1     %    
       9 Wash        Concentration average 208     Pb       0.0497  µg/l 
      10 Wash        Concentration per Run 27      Al       0.133   µg/l 
      # i 1,430 more rows

---

    Code
      out2
    Output
      # A tibble: 999 x 6
         sample_name estimate_type         isotope element    value unit 
         <chr>       <chr>                 <chr>   <chr>      <dbl> <chr>
       1 Wash        Concentration average 27      Al       0.191   µg/l 
       2 Wash        Concentration average 31      P       -0.00463 µg/l 
       3 Wash        Concentration average 45      Sc      95.9     %    
       4 Wash        Concentration average 55      Mn       0.0279  µg/l 
       5 Wash        Concentration average 56      Fe       0.0660  µg/l 
       6 Wash        Concentration average 65      Cu       0.0639  µg/l 
       7 Wash        Concentration average 115     In      96.1     %    
       8 Wash        Concentration average 159     Tb      97.6     %    
       9 Wash        Concentration average 208     Pb       0.0356  µg/l 
      10 Wash        Concentration per Run 27      Al       0.228   µg/l 
      # i 989 more rows

