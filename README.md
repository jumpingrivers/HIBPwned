# HIBPwned
[![Travis-CI Build Status](https://travis-ci.org/lockedata/HIBPwned.svg?branch=master)](https://travis-ci.org/lockedata/HIBPwned)
[![Coverage Status](https://coveralls.io/repos/github/lockedata/HIBPwned/badge.svg?branch=master)](https://coveralls.io/github/lockedata/HIBPwned?branch=master) [![CRAN version](https://www.r-pkg.org/badges/version-ago/HIBPwned)](https://www.r-pkg.org/badges/version-ago/HIBPwned)
[![Total CRAN downloads](https://cranlogs.r-pkg.org/badges/grand-total/HIBPwned)](https://cranlogs.r-pkg.org/badges/grand-total/HIBPwned) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/2091/badge)](https://bestpractices.coreinfrastructure.org/projects/2091)


Utilising the [HaveIBeenPwned.com API](https://haveibeenpwned.com/API/v2), check whether email addresses and/or user names have been present in a publicly disclosed data breach.

Head over to the [package website](https://itsalocke.com/hibpwned/) for more information, in particular [the functions reference](https://itsalocke.com/hibpwned/reference/), [an intro to the package usage](https://itsalocke.com/hibpwned/articles/hibp) and [the news](https://itsalocke.com/hibpwned/articles/hibp).

----

If you get a lot of value out of this package, do consider donating to [HaveIbeenPwned.com](https://haveibeenpwned.com/Donate) as it's a tremendous service.

----

## Examples

If you want a list of the breaches where your email address has been included, use the `account_breaches()` function with `truncate = TRUE`.

`account_breaches("steff.sullivan@gmail.com", truncate = TRUE)`

The code is vectorized, so you can search more than one account at a time. Results are organized by email address.

`account_breaches(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"), truncate = TRUE)`

If you want more data, set `truncate` to `FALSE` or leave it out.

`account_breaches(c("steff.sullivan@gmail.com","stephanie.g.locke@gmail.com"))`

For additional information about a given breach, use `breached_site()` with the name you saw from `account_breaches()`.

`breached_site("Adobe")`

----

Wanna report a bug or suggest a feature? Great stuff! For more information on how to contribute check out [our contributing guide](.github/CONTRIBUTING.md).

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

