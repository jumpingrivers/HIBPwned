# HIBPwned 0.1.7
* account_breaches: new as_list argument, when FALSE the function returns a data.frame instead of a list (TRUE, default and old behaviour).

* httr replaced with crul

* only gives the possibility to change the agent name, no other customization now.

* implemented unit tests with webmockr for testing the handling of http errors.

* now caches results inside an active R session thanks to `memoise`.

# HIBPwned 0.1.6
* Bug fix: Adding some time to the rate limit

# HIBPwned 0.1.5
* Rate Limit: Now using the package `ratelimitr` for more elegant rate limiting

# HIBPwned 0.1.3
* Rate Limit: HaveIBeenPwned is now rate limited to one request per 1.5 seconds. To accommodate this, an artificial wait has been added at the start of each call.

# HIBPwned 0.1.0.0

* New package!



