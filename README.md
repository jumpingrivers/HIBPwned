# HIBPwned



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

