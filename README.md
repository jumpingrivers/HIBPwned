<!-- README.md is generated from README.Rmd. Please edit that file -->
HIBPwned
========

[![Travis-CI Build Status](https://travis-ci.org/stephlocke/HIBPwned.svg?branch=master)](https://travis-ci.org/stephlocke/HIBPwned) [![Coverage Status](https://coveralls.io/repos/github/stephlocke/HIBPwned/badge.svg?branch=master)](https://coveralls.io/github/stephlocke/HIBPwned?branch=master) [![Total CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)](http://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)

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
devtools::install_github("stephlocke/HIBPwned")
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
#> 6              BitcoinTalk
#> 7            BlackHatWorld
#> 8                     BTCE
#> 9             CDProjektRed
#> 10           CheapAssGamer
#> 11                 DaniWeb
#> 12                 Dropbox
#> 13                  Elance
#> 14                   Evony
#> 15    FlashFlashRevolution
#> 16               Flashback
#> 17              Funimation
#> 18            GamerzPlanet
#> 19                  Gawker
#> 20                GeekedIn
#> 21         HeroesOfNewerth
#> 22                    HLTV
#> 23                  iPmart
#> 24                  Lastfm
#> 25                    Leet
#> 26                Lifeboat
#> 27                LinkedIn
#> 28          LittleMonsters
#> 29 ModernBusinessSolutions
#> 30                    MPGH
#> 31                 MySpace
#> 32                 Neopets
#> 33              Nihonomaru
#> 34               OwnedCore
#> 35                  PS3Hax
#> 36                     QIP
#> 37              QuinStreet
#> 38                 R2Games
#> 39          RiverCityMedia
#> 40                Stratfor
#> 41             SweClockers
#> 42                  Tianya
#> 43          TorrentInvites
#> 44                Trillian
#> 45                  Tumblr
#> 46               VBulletin
#> 47                      VK
#> 48                  WarInc
#> 49                     xat
#> 50              Xbox-Scene
```

``` r
breached_sites("adobe.com")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank" rel="noopener">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank" rel="noopener">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsFabricated IsSensitive IsActive IsRetired IsSpamList LogoType
#> 1        FALSE       FALSE     TRUE     FALSE      FALSE      svg
```

``` r
breached_site("Adobe")
#>   Title  Name    Domain BreachDate            AddedDate  PwnCount
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank" rel="noopener">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank" rel="noopener">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsFabricated IsSensitive IsActive IsRetired IsSpamList LogoType
#> 1        FALSE       FALSE     TRUE     FALSE      FALSE      svg
```

``` r
data_classes()
#>  [1] "Account balances"                 "Age groups"                      
#>  [3] "Astrological signs"               "Auth tokens"                     
#>  [5] "Avatars"                          "Bank account numbers"            
#>  [7] "Banking PINs"                     "Beauty ratings"                  
#>  [9] "Biometric data"                   "Browser user agent details"      
#> [11] "Car ownership statuses"           "Career levels"                   
#> [13] "Chat logs"                        "Credit card CVV"                 
#> [15] "Credit cards"                     "Credit status information"       
#> [17] "Customer feedback"                "Customer interactions"           
#> [19] "Dates of birth"                   "Deceased date"                   
#> [21] "Device information"               "Device usage tracking data"      
#> [23] "Drinking habits"                  "Drug habits"                     
#> [25] "Education levels"                 "Email addresses"                 
#> [27] "Email messages"                   "Employers"                       
#> [29] "Ethnicities"                      "Family members' names"           
#> [31] "Family plans"                     "Family structure"                
#> [33] "Financial transactions"           "Fitness levels"                  
#> [35] "Genders"                          "Geographic locations"            
#> [37] "Government issued IDs"            "Health insurance information"    
#> [39] "Historical passwords"             "Home ownership statuses"         
#> [41] "Homepage URLs"                    "Income levels"                   
#> [43] "Instant messenger identities"     "IP addresses"                    
#> [45] "Job titles"                       "MAC addresses"                   
#> [47] "Marital statuses"                 "Names"                           
#> [49] "Nicknames"                        "Parenting plans"                 
#> [51] "Partial credit card data"         "Passport numbers"                
#> [53] "Password hints"                   "Passwords"                       
#> [55] "Payment histories"                "Payment methods"                 
#> [57] "Personal descriptions"            "Personal health data"            
#> [59] "Personal interests"               "Phone numbers"                   
#> [61] "Physical addresses"               "Physical attributes"             
#> [63] "Political views"                  "Private messages"                
#> [65] "Professional skills"              "Purchases"                       
#> [67] "Purchasing habits"                "Races"                           
#> [69] "Recovery email addresses"         "Relationship statuses"           
#> [71] "Religions"                        "Reward program balances"         
#> [73] "Salutations"                      "Security questions and answers"  
#> [75] "Sexual fetishes"                  "Sexual orientations"             
#> [77] "Smoking habits"                   "SMS messages"                    
#> [79] "Social connections"               "Spoken languages"                
#> [81] "Time zones"                       "Travel habits"                   
#> [83] "User statuses"                    "User website URLs"               
#> [85] "Usernames"                        "Utility bills"                   
#> [87] "Website activity"                 "Work habits"                     
#> [89] "Years of birth"                   "Years of professional experience"
```

``` r
pastes("foo@bar.com")
#> $`foo@bar.com`
#>      Source                                                         Id
#> 1  Pastebin                                                   fzieKTTp
#> 2  Pastebin                                                   j8td6wik
#> 3  Pastebin                                                   urh5D0dT
#> 4  Pastebin                                                   VXXkSVa6
#> 5  Pastebin                                                   vwXXWCEN
#> 6  Pastebin                                                   qAegkpzu
#> 7  Pastebin                                                   Lg80iL8k
#> 8  Pastebin                                                   uMq1W2mx
#> 9  Pastebin                                                   9ZKSRx5i
#> 10 Pastebin                                                   L6fZS5VC
#> 11 Pastebin                                                   b6taeWri
#> 12 Pastebin                                                   ba6LmF9Z
#> 13 Pastebin                                                   wXb5W8GV
#> 14 Pastebin                                                   EE8GM0ed
#> 15 Pastebin                                                   8Q0BvKD8
#> 16 Pastebin                                                   C4GdBDnP
#> 17 AdHocUrl                      http://siph0n.in/exploits.php?id=4364
#> 18 AdHocUrl                      http://siph0n.in/exploits.php?id=1154
#> 19 AdHocUrl                      http://siph0n.in/exploits.php?id=4737
#> 20 AdHocUrl http://balockae.online/files/BlackMarketReloaded_users.sql
#> 21 AdHocUrl             http://balockae.online/files/blackhatworld.txt
#> 22 AdHocUrl                      http://siph0n.in/exploits.php?id=4948
#>                                                          Title
#> 1                                                         <NA>
#> 2                                                         <NA>
#> 3                                                         <NA>
#> 4                                                      Twitter
#> 5                                                 AMEmails.txt
#> 6  Working Fresh EMails Hacked [Gmail,Hotmail,Yahoo..] By Aluf
#> 7                                        www.captainfarris.com
#> 8                                                npm-debug.log
#> 9                                  1K Combo [CrackingSeal.net]
#> 10                                                kwekwekwekwk
#> 11                                                        <NA>
#> 12                                  Hacked by Kashirmi Cheetah
#> 13                                               #freenode-log
#> 14                                                        <NA>
#> 15                                                      syslog
#> 16                                          #secuinside13 logs
#> 17                                                   siph0n.in
#> 18                                                   siph0n.in
#> 19                                   PayPalSucks Database 102k
#> 20                                             balockae.online
#> 21                                             balockae.online
#> 22                                         http://taptoeat.com
#>                    Date EmailCount
#> 1  2017-03-23T23:08:02Z         82
#> 2  2017-03-23T22:16:04Z         20
#> 3  2016-01-25T16:54:32Z         22
#> 4  2015-12-12T15:52:27Z         90
#> 5  2015-08-19T05:32:23Z      10437
#> 6  2015-06-09T11:16:36Z       7663
#> 7  2015-05-29T20:32:46Z       1081
#> 8  2015-05-10T23:57:41Z         40
#> 9  2015-04-19T13:06:08Z        999
#> 10 2015-02-18T15:30:00Z      14427
#> 11 2014-11-17T08:11:00Z        972
#> 12 2014-09-08T08:09:00Z       1799
#> 13 2014-07-06T19:07:00Z        187
#> 14 2014-03-26T17:03:00Z         80
#> 15 2014-03-04T19:03:00Z        139
#> 16 2013-05-26T22:05:00Z        255
#> 17                 <NA>      89270
#> 18                 <NA>       1595
#> 19                 <NA>      82071
#> 20                 <NA>      10547
#> 21                 <NA>     775678
#> 22                 <NA>      31941
```
