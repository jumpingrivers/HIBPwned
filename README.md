<!-- README.md is generated from README.Rmd. Please edit that file -->
HIBPwned
========

[![Travis-CI Build Status](https://travis-ci.org/censornet/HIBPwned.svg?branch=master)](https://travis-ci.org/censornet/HIBPwned) [![Coverage Status](https://img.shields.io/coveralls/censornet/HIBPwned.svg)](https://coveralls.io/r/censornet/HIBPwned?branch=master) [![Total CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)

Utilising the [HaveIBeenPwned.com API](https://haveibeenpwned.com/API/v2), check whether email addresses and/or user names have been present in a publicly disclosed data breach.

``` r
if(!require("devtools")) install.packages("devtools")
# Get or upgrade from github
devtools::install_github("censornet/HIBPwned")
library("HIBPwned")
```

``` r
account_breaches("steff.sullivan@gmail.com", truncate=TRUE)
#> $`steff.sullivan@gmail.com`
#>       Name
#> 1    Adobe
#> 2 LinkedIn
```

``` r
breached_sites("adobe.com")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive IsActive IsRetired LogoType
#> 1       FALSE     TRUE     FALSE      svg
```

``` r
breached_site("Adobe")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive IsActive IsRetired LogoType
#> 1       FALSE     TRUE     FALSE      svg
```

``` r
data_classes()
#>  [1] "Account balances"               "Age groups"                    
#>  [3] "Astrological signs"             "Avatars"                       
#>  [5] "Bank account numbers"           "Banking PINs"                  
#>  [7] "Beauty ratings"                 "Biometric data"                
#>  [9] "Car ownership statuses"         "Career levels"                 
#> [11] "Credit cards"                   "Customer feedback"             
#> [13] "Customer interactions"          "Dates of birth"                
#> [15] "Device usage tracking data"     "Drinking habits"               
#> [17] "Drug habits"                    "Education levels"              
#> [19] "Email addresses"                "Email messages"                
#> [21] "Employers"                      "Ethnicities"                   
#> [23] "Family members' names"          "Family plans"                  
#> [25] "Financial transactions"         "Fitness levels"                
#> [27] "Genders"                        "Geographic locations"          
#> [29] "Government issued IDs"          "Historical passwords"          
#> [31] "Home addresses"                 "Home ownership statuses"       
#> [33] "Homepage URLs"                  "Income levels"                 
#> [35] "Instant messenger identities"   "IP addresses"                  
#> [37] "Job titles"                     "MAC addresses"                 
#> [39] "Marital statuses"               "Names"                         
#> [41] "Nicknames"                      "Parenting plans"               
#> [43] "Passport numbers"               "Password hints"                
#> [45] "Passwords"                      "Payment histories"             
#> [47] "Personal descriptions"          "Personal interests"            
#> [49] "Phone numbers"                  "Physical attributes"           
#> [51] "Political views"                "Private messages"              
#> [53] "Purchases"                      "Races"                         
#> [55] "Recovery email addresses"       "Relationship statuses"         
#> [57] "Religions"                      "Reward program balances"       
#> [59] "Salutations"                    "Security questions and answers"
#> [61] "Sexual fetishes"                "Sexual orientations"           
#> [63] "Smoking habits"                 "SMS messages"                  
#> [65] "Social connections"             "Spoken languages"              
#> [67] "Time zones"                     "Travel habits"                 
#> [69] "User agent details"             "User website URLs"             
#> [71] "Usernames"                      "Website activity"              
#> [73] "Work habits"                    "Years of birth"
```

``` r
pastes("foo@bar.com")
#> $`foo@bar.com`
#>      Source                                    Id
#> 1  Pastebin                              urh5D0dT
#> 2  Pastebin                              VXXkSVa6
#> 3  Pastebin                              vwXXWCEN
#> 4  Pastebin                              qAegkpzu
#> 5  Pastebin                              Lg80iL8k
#> 6  Pastebin                              uMq1W2mx
#> 7  Pastebin                              9ZKSRx5i
#> 8  Pastebin                              L6fZS5VC
#> 9  Pastebin                              b6taeWri
#> 10 Pastebin                              ba6LmF9Z
#> 11 Pastebin                              wXb5W8GV
#> 12 Pastebin                              EE8GM0ed
#> 13 Pastebin                              8Q0BvKD8
#> 14 Pastebin                              C4GdBDnP
#> 15 AdHocUrl http://siph0n.in/exploits.php?id=4364
#> 16 AdHocUrl http://siph0n.in/exploits.php?id=1154
#> 17 AdHocUrl http://siph0n.in/exploits.php?id=4737
#>                                                          Title
#> 1                                                         <NA>
#> 2                                                      Twitter
#> 3                                                 AMEmails.txt
#> 4  Working Fresh EMails Hacked [Gmail,Hotmail,Yahoo..] By Aluf
#> 5                                        www.captainfarris.com
#> 6                                                npm-debug.log
#> 7                                  1K Combo [CrackingSeal.net]
#> 8                                                 kwekwekwekwk
#> 9                                                         <NA>
#> 10                                  Hacked by Kashirmi Cheetah
#> 11                                               #freenode-log
#> 12                                                        <NA>
#> 13                                                      syslog
#> 14                                          #secuinside13 logs
#> 15                                                   siph0n.in
#> 16                                                   siph0n.in
#> 17                                   PayPalSucks Database 102k
#>                    Date EmailCount
#> 1  2016-01-25T16:54:32Z         22
#> 2  2015-12-12T15:52:27Z         90
#> 3  2015-08-19T05:32:23Z      10437
#> 4  2015-06-09T11:16:36Z       7663
#> 5  2015-05-29T20:32:46Z       1081
#> 6  2015-05-10T23:57:41Z         40
#> 7  2015-04-19T13:06:08Z        999
#> 8  2015-02-18T15:30:00Z      14427
#> 9  2014-11-17T08:11:00Z        972
#> 10 2014-09-08T08:09:00Z       1799
#> 11 2014-07-06T19:07:00Z        187
#> 12 2014-03-26T17:03:00Z         80
#> 13 2014-03-04T19:03:00Z        139
#> 14 2013-05-26T22:05:00Z        255
#> 15                 <NA>      89270
#> 16                 <NA>       1595
#> 17                 <NA>      82071
```

------------------------------------------------------------------------

If you get a lot of value out of this package, do consider [donating to HIBP](https://haveibeenpwned.com/Donate) since Troy Hunt does not put any limits on the API and it's a tremendous service.

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
