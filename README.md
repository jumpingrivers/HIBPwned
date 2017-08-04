
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
#> 13                  Edmodo
#> 14                  Elance
#> 15                   Evony
#> 16    FlashFlashRevolution
#> 17               Flashback
#> 18              Funimation
#> 19            GamerzPlanet
#> 20                  Gawker
#> 21                GeekedIn
#> 22         HeroesOfNewerth
#> 23                    HLTV
#> 24                  iPmart
#> 25                  Lastfm
#> 26                    Leet
#> 27                Lifeboat
#> 28                LinkedIn
#> 29          LittleMonsters
#> 30 ModernBusinessSolutions
#> 31                    MPGH
#> 32                 MySpace
#> 33                 Neopets
#> 34              Nihonomaru
#> 35               OwnedCore
#> 36                  PS3Hax
#> 37                     QIP
#> 38              QuinStreet
#> 39                 R2Games
#> 40          RiverCityMedia
#> 41                Stratfor
#> 42             SweClockers
#> 43                  Tianya
#> 44          TorrentInvites
#> 45                Trillian
#> 46                  Tumblr
#> 47               VBulletin
#> 48                      VK
#> 49                  WarInc
#> 50                     xat
#> 51              Xbox-Scene
```

``` r
breached_sites("adobe.com")
#>   Title  Name    Domain BreachDate            AddedDate
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z
#>           ModifiedDate  PwnCount
#> 1 2013-12-04T00:00:00Z 152445165
#>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Description
#> 1 In October 2013, 153 million Adobe accounts were breached with each containing an internal ID, username, email, <em>encrypted</em> password and a password hint in plain text. The password cryptography was poorly done and <a href="http://stricture-group.com/files/adobe-top100.txt" target="_blank" rel="noopener">many were quickly resolved back to plain text</a>. The unencrypted hints also <a href="http://www.troyhunt.com/2013/11/adobe-credentials-and-serious.html" target="_blank" rel="noopener">disclosed much about the passwords</a> adding further to the risk that hundreds of millions of Adobe customers already faced.
#>                                             DataClasses IsVerified
#> 1 Email addresses, Password hints, Passwords, Usernames       TRUE
#>   IsFabricated IsSensitive IsActive IsRetired IsSpamList LogoType
#> 1        FALSE       FALSE     TRUE     FALSE      FALSE      svg
```

``` r
breached_site("Adobe")
#>   Title  Name    Domain BreachDate            AddedDate
#> 1 Adobe Adobe adobe.com 2013-10-04 2013-12-04T00:00:00Z
#>           ModifiedDate  PwnCount
#> 1 2013-12-04T00:00:00Z 152445165
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
#> [11] "Buying preferences"               "Car ownership statuses"          
#> [13] "Career levels"                    "Charitable donations"            
#> [15] "Chat logs"                        "Credit card CVV"                 
#> [17] "Credit cards"                     "Credit status information"       
#> [19] "Customer feedback"                "Customer interactions"           
#> [21] "Dates of birth"                   "Deceased date"                   
#> [23] "Device information"               "Device usage tracking data"      
#> [25] "Drinking habits"                  "Drug habits"                     
#> [27] "Education levels"                 "Email addresses"                 
#> [29] "Email messages"                   "Employers"                       
#> [31] "Ethnicities"                      "Family members' names"           
#> [33] "Family plans"                     "Family structure"                
#> [35] "Financial investments"            "Financial transactions"          
#> [37] "Fitness levels"                   "Genders"                         
#> [39] "Geographic locations"             "Government issued IDs"           
#> [41] "Health insurance information"     "Historical passwords"            
#> [43] "Home ownership statuses"          "Homepage URLs"                   
#> [45] "Income levels"                    "Instant messenger identities"    
#> [47] "IP addresses"                     "Job titles"                      
#> [49] "MAC addresses"                    "Marital statuses"                
#> [51] "Names"                            "Net worths"                      
#> [53] "Nicknames"                        "Parenting plans"                 
#> [55] "Partial credit card data"         "Passport numbers"                
#> [57] "Password hints"                   "Passwords"                       
#> [59] "Payment histories"                "Payment methods"                 
#> [61] "Personal descriptions"            "Personal health data"            
#> [63] "Personal interests"               "Phone numbers"                   
#> [65] "Physical addresses"               "Physical attributes"             
#> [67] "Political donations"              "Political views"                 
#> [69] "Private messages"                 "Professional skills"             
#> [71] "Purchases"                        "Purchasing habits"               
#> [73] "Races"                            "Recovery email addresses"        
#> [75] "Relationship statuses"            "Religions"                       
#> [77] "Reward program balances"          "Salutations"                     
#> [79] "Security questions and answers"   "Sexual fetishes"                 
#> [81] "Sexual orientations"              "Smoking habits"                  
#> [83] "SMS messages"                     "Social connections"              
#> [85] "Spoken languages"                 "Survey results"                  
#> [87] "Time zones"                       "Travel habits"                   
#> [89] "User statuses"                    "User website URLs"               
#> [91] "Usernames"                        "Utility bills"                   
#> [93] "Vehicle details"                  "Website activity"                
#> [95] "Work habits"                      "Years of birth"                  
#> [97] "Years of professional experience"
```

``` r
pastes("foo@bar.com")
#> $`foo@bar.com`
#>      Source                                                         Id
#> 1  Pastebin                                                   rGxXMsXA
#> 2  Pastebin                                                   fzieKTTp
#> 3  Pastebin                                                   j8td6wik
#> 4  Pastebin                                                   urh5D0dT
#> 5  Pastebin                                                   VXXkSVa6
#> 6  Pastebin                                                   vwXXWCEN
#> 7  Pastebin                                                   qAegkpzu
#> 8  Pastebin                                                   Lg80iL8k
#> 9  Pastebin                                                   uMq1W2mx
#> 10 Pastebin                                                   9ZKSRx5i
#> 11 Pastebin                                                   L6fZS5VC
#> 12 Pastebin                                                   b6taeWri
#> 13 Pastebin                                                   ba6LmF9Z
#> 14 Pastebin                                                   wXb5W8GV
#> 15 Pastebin                                                   EE8GM0ed
#> 16 Pastebin                                                   8Q0BvKD8
#> 17 Pastebin                                                   C4GdBDnP
#> 18 AdHocUrl                      http://siph0n.in/exploits.php?id=4364
#> 19 AdHocUrl                      http://siph0n.in/exploits.php?id=1154
#> 20 AdHocUrl                      http://siph0n.in/exploits.php?id=4737
#> 21 AdHocUrl http://balockae.online/files/BlackMarketReloaded_users.sql
#> 22 AdHocUrl             http://balockae.online/files/blackhatworld.txt
#> 23 AdHocUrl                      http://siph0n.in/exploits.php?id=4948
#>                                                          Title
#> 1                                                           kk
#> 2                                                         <NA>
#> 3                                                         <NA>
#> 4                                                         <NA>
#> 5                                                      Twitter
#> 6                                                 AMEmails.txt
#> 7  Working Fresh EMails Hacked [Gmail,Hotmail,Yahoo..] By Aluf
#> 8                                        www.captainfarris.com
#> 9                                                npm-debug.log
#> 10                                 1K Combo [CrackingSeal.net]
#> 11                                                kwekwekwekwk
#> 12                                                        <NA>
#> 13                                  Hacked by Kashirmi Cheetah
#> 14                                               #freenode-log
#> 15                                                        <NA>
#> 16                                                      syslog
#> 17                                          #secuinside13 logs
#> 18                                                   siph0n.in
#> 19                                                   siph0n.in
#> 20                                   PayPalSucks Database 102k
#> 21                                             balockae.online
#> 22                                             balockae.online
#> 23                                         http://taptoeat.com
#>                    Date EmailCount
#> 1  2017-05-27T01:41:59Z      20551
#> 2  2017-03-23T23:08:02Z         82
#> 3  2017-03-23T22:16:04Z         20
#> 4  2016-01-25T16:54:32Z         22
#> 5  2015-12-12T15:52:27Z         90
#> 6  2015-08-19T05:32:23Z      10437
#> 7  2015-06-09T11:16:36Z       7663
#> 8  2015-05-29T20:32:46Z       1081
#> 9  2015-05-10T23:57:41Z         40
#> 10 2015-04-19T13:06:08Z        999
#> 11 2015-02-18T15:30:00Z      14427
#> 12 2014-11-17T08:11:00Z        972
#> 13 2014-09-08T08:09:00Z       1799
#> 14 2014-07-06T19:07:00Z        187
#> 15 2014-03-26T17:03:00Z         80
#> 16 2014-03-04T19:03:00Z        139
#> 17 2013-05-26T22:05:00Z        255
#> 18                 <NA>      89270
#> 19                 <NA>       1595
#> 20                 <NA>      82071
#> 21                 <NA>      10547
#> 22                 <NA>     775678
#> 23                 <NA>      31941
```
