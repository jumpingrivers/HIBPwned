<!-- README.md is generated from README.Rmd. Please edit that file -->
HIBPwned
========

[![Travis-CI Build Status](https://travis-ci.org/stephlocke/HIBPwned.svg?branch=master)](https://travis-ci.org/stephlocke/HIBPwned) [![Coverage Status](https://img.shields.io/coveralls/stephlocke/HIBPwned.svg)](https://coveralls.io/r/stephlocke/HIBPwned?branch=master)

Utilising the [HaveIBeenPwned.com API](https://haveibeenpwned.com/API/v2), check whether email addresses and/or user names have been present in a publicly disclosed data breach.

``` r
if(!require("devtools")) install.packages("devtools")
# Get or upgrade from github
devtools::install_github("stephlocke/HIBPwned")
```

``` r
library("HIBPwned")
account_breaches("steff.sullivan@gmail.com", truncate=TRUE)
#> $`steff.sullivan@gmail.com`
#>    Name
#> 1 Adobe
```

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
