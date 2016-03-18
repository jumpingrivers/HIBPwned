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

``` r
library("HIBPwned")
breached_sites("adobe.com")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Description
#> 1 The big one. In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive LogoType
#> 1       FALSE      svg
```

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
