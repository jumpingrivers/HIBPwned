## Test environments
* local x86_64-w64-mingw32/x64 install, R 3.3.1
* Ubuntu 12.04 (on Travis CI), R devel, release and oldrel
* OSX release (Travis CI)

## R CMD check results

0 errors | 0 warnings | 0 note

## Release summary

* account_breaches: new as_list argument, when FALSE the function returns a data.frame instead of a list (TRUE, default and old behaviour).

* httr replaced with crul

* only gives the possibility to change the agent name, no other customization now.

* implemented unit tests with webmockr for testing the handling of http errors.

* now caches results inside an active R session thanks to `memoise`.

---
