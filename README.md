
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cwrshelpr

<!-- badges: start --> 
<!-- badges: end -->

`cwrshelpr` provides a collection of functions for data analysis tasks
at Dalhousie University’s Centre for Water Resources Studies.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("bentrueman/cwrshelpr")
```

## Read and clean ICP-MS data

To read and clean ICP-MS data files generated by the Thermo Scientific
iCAP-RQ, use the `read_icp()` function. (N.B., the code below uses
external raw data files as examples; replace them with your data.)

``` r
library("tidyverse")
library("cwrshelpr")
# example path to example raw data file
files <- list.files(
   path = system.file("extdata", package = "cwrshelpr"), # replace this line with the path to your data
   full.names = TRUE,
   pattern = ".+\\.xlsx"
)
read_icp(path = files[1]) # read and clean one file
#> # A tibble: 1,440 × 6
#>    sample_name estimate_type         isotope element    value unit 
#>    <chr>       <chr>                 <chr>   <chr>      <dbl> <chr>
#>  1 Wash        Concentration average 27      Al       0.115   µg/l 
#>  2 Wash        Concentration average 31      P       -0.0408  µg/l 
#>  3 Wash        Concentration average 45      Sc      99.6     %    
#>  4 Wash        Concentration average 55      Mn      -0.00621 µg/l 
#>  5 Wash        Concentration average 56      Fe       0.0124  µg/l 
#>  6 Wash        Concentration average 65      Cu       0.0396  µg/l 
#>  7 Wash        Concentration average 115     In      99.2     %    
#>  8 Wash        Concentration average 159     Tb      98.1     %    
#>  9 Wash        Concentration average 208     Pb       0.0497  µg/l 
#> 10 Wash        Concentration per Run 27      Al       0.133   µg/l 
#> # … with 1,430 more rows
files %>% 
  set_names() %>% 
  map_dfr(read_icp, .id = "file") # read and clean multiple files
#> # A tibble: 2,439 × 7
#>    file                sample_name estimate_type  isotope element    value unit 
#>    <chr>               <chr>       <chr>          <chr>   <chr>      <dbl> <chr>
#>  1 /private/var/folde… Wash        Concentration… 27      Al       0.115   µg/l 
#>  2 /private/var/folde… Wash        Concentration… 31      P       -0.0408  µg/l 
#>  3 /private/var/folde… Wash        Concentration… 45      Sc      99.6     %    
#>  4 /private/var/folde… Wash        Concentration… 55      Mn      -0.00621 µg/l 
#>  5 /private/var/folde… Wash        Concentration… 56      Fe       0.0124  µg/l 
#>  6 /private/var/folde… Wash        Concentration… 65      Cu       0.0396  µg/l 
#>  7 /private/var/folde… Wash        Concentration… 115     In      99.2     %    
#>  8 /private/var/folde… Wash        Concentration… 159     Tb      98.1     %    
#>  9 /private/var/folde… Wash        Concentration… 208     Pb       0.0497  µg/l 
#> 10 /private/var/folde… Wash        Concentration… 27      Al       0.133   µg/l 
#> # … with 2,429 more rows
```

## Read and clean FEEM data

To read and clean FEEM data files generated by the Horiba Aqualog, use
the `read_feem()` function.

``` r
files <- list.files(
   path = system.file("extdata", package = "cwrshelpr"), # replace this line with the path to your data
   full.names = TRUE,
   pattern = ".+\\.csv"
)
read_feem(path = files[1]) # read and clean one file
#> # A tibble: 15,125 × 4
#>    emission em_regular excitation intensity
#>       <dbl>      <dbl>      <dbl>     <dbl>
#>  1     212.       212.        600         0
#>  2     212.       212.        597         0
#>  3     212.       212.        594         0
#>  4     212.       212.        591         0
#>  5     212.       212.        588         0
#>  6     212.       212.        585         0
#>  7     212.       212.        582         0
#>  8     212.       212.        579         0
#>  9     212.       212.        576         0
#> 10     212.       212.        573         0
#> # … with 15,115 more rows
feem_dat <- files %>% 
  set_names() %>% 
  map_dfr(read_feem, .id = "file") # read and clean multiple files
```

Plot FEEM data using `ggplot2::geom_raster()`. Use the column
`em_regular` to avoid horizontal striping due to irregular spacing of
the `emission` wavelengths.

``` r
feem_dat %>% 
  ggplot(aes(excitation, em_regular, fill = intensity)) +
  facet_wrap(vars(file)) + 
  geom_raster()
```

<img src="man/figures/README-feem-plot-1.png" width="100%" />
