<!-- README.md is generated from README.Rmd. Please edit that file -->
HIBPwned
========

[![Travis-CI Build Status](https://travis-ci.org/censornet/HIBPwned.svg?branch=master)](https://travis-ci.org/censornet/HIBPwned) [![Coverage Status](https://coveralls.io/repos/github/censornet/HIBPwned/badge.svg?branch=master)](https://coveralls.io/github/censornet/HIBPwned?branch=master) [![Total CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)

Utilising the [HaveIBeenPwned.com API](https://haveibeenpwned.com/API/v2), check whether email addresses and/or user names have been present in a publicly disclosed data breach.

News
----

HaveIBeenPwned is now rate limited to one request per 1.5 seconds. To facilitate this, I added a Sleep command. This was inelegant. Instead, the package now relies on the package [ratelimitr](https://github.com/tarakc02/ratelimitr) to perform rate limiting.

Tests
-----

``` r
devtools::test()
#> Loading HIBPwned
#> Loading required package: testthat
#> Testing HIBPwned
#> account_breaches: .....................................................................
#> breached_site: ..........
#> breached_sites: .............
#> data_classes: ...
#> HIBP_headers: ...............
#> pastes: ...................
#> 
#> DONE ======================================================================
```

------------------------------------------------------------------------

If you get a lot of value out of this package, do consider donating to [HaveIbeenPwned.com](https://haveibeenpwned.com/Donate) as it's a tremendous service.

------------------------------------------------------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

------------------------------------------------------------------------

Usage
-----

``` r
if(!require("devtools")) install.packages("devtools")
# Get or upgrade from github
devtools::install_github("censornet/HIBPwned")
library("HIBPwned")
```

``` r
account_breaches("foo@bar.com", truncate=TRUE)
#> $`foo@bar.com`
#>                       Name
#> 1               000webhost
#> 2                  AcneOrg
#> 3                    Adobe
#> 4            AndroidForums
#> 5          ArmyForceOnline
#> 6            BlackHatWorld
#> 7            CheapAssGamer
#> 8                  Dropbox
#> 9     FlashFlashRevolution
#> 10               Flashback
#> 11            GamerzPlanet
#> 12                  Gawker
#> 13         HeroesOfNewerth
#> 14                  iPmart
#> 15                  Lastfm
#> 16                    Leet
#> 17                Lifeboat
#> 18                LinkedIn
#> 19 ModernBusinessSolutions
#> 20                    MPGH
#> 21                 MySpace
#> 22                 Neopets
#> 23              Nihonomaru
#> 24               OwnedCore
#> 25                  PS3Hax
#> 26                 R2Games
#> 27                Stratfor
#> 28                  Tianya
#> 29                Trillian
#> 30                  Tumblr
#> 31               VBulletin
#> 32                      VK
#> 33                  WarInc
#> 34                     xat
#> 35              Xbox-Scene
```

``` r
breached_sites("adobe.com")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank" rel="noopener">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank" rel="noopener">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive IsActive IsRetired LogoType
#> 1       FALSE     TRUE     FALSE      svg
```

``` r
breached_site("Adobe")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank" rel="noopener">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank" rel="noopener">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsSensitive IsActive IsRetired LogoType
#> 1       FALSE     TRUE     FALSE      svg
```

``` r
data_classes()
#>  [1] "[empty, waiting for next value]" "Account balances"               
#>  [3] "Age groups"                      "Astrological signs"             
#>  [5] "Avatars"                         "Bank account numbers"           
#>  [7] "Banking PINs"                    "Beauty ratings"                 
#>  [9] "Biometric data"                  "Browser user agent details"     
#> [11] "Car ownership statuses"          "Career levels"                  
#> [13] "Chat logs"                       "Credit card CVV"                
#> [15] "Credit cards"                    "Credit status information"      
#> [17] "Customer feedback"               "Customer interactions"          
#> [19] "Dates of birth"                  "Deceased date"                  
#> [21] "Device information"              "Device usage tracking data"     
#> [23] "Drinking habits"                 "Drug habits"                    
#> [25] "Education levels"                "Email addresses"                
#> [27] "Email messages"                  "Employers"                      
#> [29] "Ethnicities"                     "Family members' names"          
#> [31] "Family plans"                    "Family structure"               
#> [33] "Financial transactions"          "Fitness levels"                 
#> [35] "Genders"                         "Geographic locations"           
#> [37] "Government issued IDs"           "Historical passwords"           
#> [39] "Home ownership statuses"         "Homepage URLs"                  
#> [41] "Income levels"                   "Instant messenger identities"   
#> [43] "IP addresses"                    "Job titles"                     
#> [45] "MAC addresses"                   "Marital statuses"               
#> [47] "Names"                           "Nicknames"                      
#> [49] "Parenting plans"                 "Partial credit card data"       
#> [51] "Passport numbers"                "Password hints"                 
#> [53] "Passwords"                       "Payment histories"              
#> [55] "Payment methods"                 "Personal descriptions"          
#> [57] "Personal interests"              "Phone numbers"                  
#> [59] "Physical addresses"              "Physical attributes"            
#> [61] "Political views"                 "Private messages"               
#> [63] "Purchases"                       "Purchasing habits"              
#> [65] "Races"                           "Recovery email addresses"       
#> [67] "Relationship statuses"           "Religions"                      
#> [69] "Reward program balances"         "Salutations"                    
#> [71] "Security questions and answers"  "Sexual fetishes"                
#> [73] "Sexual orientations"             "Smoking habits"                 
#> [75] "SMS messages"                    "Social connections"             
#> [77] "Spoken languages"                "Time zones"                     
#> [79] "Travel habits"                   "User statuses"                  
#> [81] "User website URLs"               "Usernames"                      
#> [83] "Utility bills"                   "Website activity"               
#> [85] "Work habits"                     "Years of birth"
```

``` r
pastes("foo@bar.com")
#> $`foo@bar.com`
#>      Source                                                         Id
#> 1  Pastebin                                                   urh5D0dT
#> 2  Pastebin                                                   VXXkSVa6
#> 3  Pastebin                                                   vwXXWCEN
#> 4  Pastebin                                                   qAegkpzu
#> 5  Pastebin                                                   Lg80iL8k
#> 6  Pastebin                                                   uMq1W2mx
#> 7  Pastebin                                                   9ZKSRx5i
#> 8  Pastebin                                                   L6fZS5VC
#> 9  Pastebin                                                   b6taeWri
#> 10 Pastebin                                                   ba6LmF9Z
#> 11 Pastebin                                                   wXb5W8GV
#> 12 Pastebin                                                   EE8GM0ed
#> 13 Pastebin                                                   8Q0BvKD8
#> 14 Pastebin                                                   C4GdBDnP
#> 15 AdHocUrl                      http://siph0n.in/exploits.php?id=4364
#> 16 AdHocUrl                      http://siph0n.in/exploits.php?id=1154
#> 17 AdHocUrl                      http://siph0n.in/exploits.php?id=4737
#> 18 AdHocUrl http://balockae.online/files/BlackMarketReloaded_users.sql
#> 19 AdHocUrl             http://balockae.online/files/blackhatworld.txt
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
#> 18                                             balockae.online
#> 19                                             balockae.online
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
#> 18                 <NA>      10547
#> 19                 <NA>     775678
```
