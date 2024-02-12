Formats data matrices in a standardized way.

* this package was originally hosted at github.com/Benjamin-Vincent-Lab/VincentLabFormatter , moved here on 2/12/2024

## Assembling this package
In R:
``` r
housekeeping::assemble_package(package_name = "VincentLabFormatter", my_version = "0.0-1",
  my_dir = "/datastore/alldata/shiny-server/rstudio-common/sent13/packages/VincentLabFormatter")
```

## Install
Restart R
In R (local library, packrat library):
``` r
devtools::install_github("Benjamin-Vincent-Lab/VincentLabFormatter")
```

Or for a specific version:
``` r
devtools::install_github("Benjamin-Vincent-Lab/VincentLabFormatter", ref = "0.0-1")
```
