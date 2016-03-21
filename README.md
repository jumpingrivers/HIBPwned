<!-- README.md is generated from README.Rmd. Please edit that file -->
HIBPwned
========

[![Travis-CI Build Status](https://travis-ci.org/stephlocke/HIBPwned.svg?branch=master)](https://travis-ci.org/stephlocke/HIBPwned) [![Coverage Status](https://img.shields.io/coveralls/stephlocke/HIBPwned.svg)](https://coveralls.io/r/stephlocke/HIBPwned?branch=master)

Utilising the [HaveIBeenPwned.com API](https://haveibeenpwned.com/API/v2), check whether email addresses and/or user names have been present in a publicly disclosed data breach.

``` r
if(!require("devtools")) install.packages("devtools")
# Get or upgrade from github
devtools::install_github("stephlocke/HIBPwned")
library("HIBPwned")
```

``` r
account_breaches("steff.sullivan@gmail.com", truncate=TRUE)
#> $`steff.sullivan@gmail.com`
#>    Name
#> 1 Adobe
```

``` r
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

``` r
breached_site("Adobe")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Description
#> 1 The big one. In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive LogoType
#> 1       FALSE      svg
```

``` r
data_classes()
#>  [1] "Account balances"               "Age groups"                    
#>  [3] "Avatars"                        "Career levels"                 
#>  [5] "Credit cards"                   "Customer interactions"         
#>  [7] "Dates of birth"                 "Device usage tracking data"    
#>  [9] "Education levels"               "Email addresses"               
#> [11] "Email messages"                 "Employers"                     
#> [13] "Ethnicities"                    "Genders"                       
#> [15] "Geographic location"            "Government issued IDs"         
#> [17] "Historical passwords"           "Home addresses"                
#> [19] "Homepage URLs"                  "Instant messenger identities"  
#> [21] "IP addresses"                   "Job titles"                    
#> [23] "MAC addresses"                  "Names"                         
#> [25] "Nicknames"                      "Passport numbers"              
#> [27] "Password hints"                 "Passwords"                     
#> [29] "Payment histories"              "Phone numbers"                 
#> [31] "Private messages"               "Purchases"                     
#> [33] "Races"                          "Recovery email addresses"      
#> [35] "Relationship statuses"          "Reward program balances"       
#> [37] "Salutations"                    "Security questions and answers"
#> [39] "Sexual preferences"             "SMS messages"                  
#> [41] "Social connections"             "Spoken languages"              
#> [43] "Time zones"                     "User agent details"            
#> [45] "User website URLs"              "Usernames"                     
#> [47] "Website activity"               "Years of birth"
```

------------------------------------------------------------------------

If you get a lot of value out of this package, do consider [donating to HIBP](https://haveibeenpwned.com/Donate) since Troy Hunt does not put any limits on the API and it's a tremendous service.

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
