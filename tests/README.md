Tests and Coverage
================
22 October, 2018 11:22:01

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                           | Coverage (%) |
| :----------------------------------------------- | :----------: |
| HIBPwned                                         |     100      |
| [R/account\_breaches.R](../R/account_breaches.R) |     100      |
| [R/breached\_site.R](../R/breached_site.R)       |     100      |
| [R/breached\_sites.R](../R/breached_sites.R)     |     100      |
| [R/data\_classes.R](../R/data_classes.R)         |     100      |
| [R/HIBP\_headers.R](../R/HIBP_headers.R)         |     100      |
| [R/pastes.R](../R/pastes.R)                      |     100      |
| [R/utils.R](../R/utils.R)                        |     100      |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat)
package.

| file                                                                |  n |   time | error | failed | skipped | warning |
| :------------------------------------------------------------------ | -: | -----: | ----: | -----: | ------: | ------: |
| [test-account\_breaches.R](testthat/test-account_breaches.R)        | 73 |  20.53 |     0 |      0 |       0 |       0 |
| [test-breached\_site.R](testthat/test-breached_site.R)              | 10 |   5.85 |     0 |      0 |       0 |       0 |
| [test-breached\_sites.R](testthat/test-breached_sites.R)            | 13 |   8.11 |     0 |      0 |       0 |       0 |
| [test-data\_classes.R](testthat/test-data_classes.R)                |  3 |   3.55 |     0 |      0 |       0 |       0 |
| [test-HIBP\_headers.R](testthat/test-HIBP_headers.R)                |  9 |   0.66 |     0 |      0 |       0 |       0 |
| [test-http-errors-handling.R](testthat/test-http-errors-handling.R) |  5 | 253.47 |     0 |      0 |       0 |       0 |
| [test-lintr.R](testthat/test-lintr.R)                               |  1 |  25.86 |     0 |      0 |       0 |       0 |
| [test-pastes.R](testthat/test-pastes.R)                             | 19 |   6.07 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results
</summary>

| file                                                                    | context             | test                                             | status |  n |   time |
| :---------------------------------------------------------------------- | :------------------ | :----------------------------------------------- | :----- | -: | -----: |
| [test-account\_breaches.R](testthat/test-account_breaches.R#L9)         | account\_breaches   | account\_breaches works for a single account     | PASS   | 24 |   8.45 |
| [test-account\_breaches.R](testthat/test-account_breaches.R#L53)        | account\_breaches   | account\_breaches works for multiple accounts    | PASS   | 37 |  11.86 |
| [test-account\_breaches.R](testthat/test-account_breaches.R#L111)       | account\_breaches   | handles incorrect values                         | PASS   |  8 |   0.17 |
| [test-account\_breaches.R](testthat/test-account_breaches.R#L127)       | account\_breaches   | account\_breaches can return a single data.frame | PASS   |  4 |   0.05 |
| [test-breached\_site.R](testthat/test-breached_site.R#L8)               | breached\_site      | breached\_site works                             | PASS   |  7 |   5.83 |
| [test-breached\_site.R](testthat/test-breached_site.R#L27)              | breached\_site      | handles incorrect values                         | PASS   |  3 |   0.02 |
| [test-breached\_sites.R](testthat/test-breached_sites.R#L8)             | breached\_sites     | breached\_sites works                            | PASS   | 10 |   8.08 |
| [test-breached\_sites.R](testthat/test-breached_sites.R#L34)            | breached\_sites     | handles incorrect values                         | PASS   |  3 |   0.03 |
| [test-data\_classes.R](testthat/test-data_classes.R#L5)                 | data\_classes       | data\_classes works                              | PASS   |  3 |   3.55 |
| [test-HIBP\_headers.R](testthat/test-HIBP_headers.R#L7)                 | HIBP\_headers       | headers are constructed correctly                | PASS   |  4 |   0.02 |
| [test-HIBP\_headers.R](testthat/test-HIBP_headers.R#L19)                | HIBP\_headers       | alternative agents work                          | PASS   |  2 |   0.62 |
| [test-HIBP\_headers.R](testthat/test-HIBP_headers.R#L28)                | HIBP\_headers       | handles incorrect values                         | PASS   |  3 |   0.02 |
| [test-http-errors-handling.R](testthat/test-http-errors-handling.R#L9)  | http error handling | no 404 http errors are handled as expected       | PASS   |  3 | 251.82 |
| [test-http-errors-handling.R](testthat/test-http-errors-handling.R#L24) | http error handling | 404 http errors are handled as expected          | PASS   |  2 |   1.65 |
| [test-lintr.R](testthat/test-lintr.R#L6)                                | lints               | Package Code Style                               | PASS   |  1 |  25.86 |
| [test-pastes.R](testthat/test-pastes.R#L9)                              | pastes              | pastes works for a single account                | PASS   |  7 |   2.18 |
| [test-pastes.R](testthat/test-pastes.R#L26)                             | pastes              | pastes works for multiple accounts               | PASS   | 10 |   3.88 |
| [test-pastes.R](testthat/test-pastes.R#L43)                             | pastes              | handles incorrect values                         | PASS   |  2 |   0.01 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                            |
| :------- | :------------------------------- |
| Version  | R version 3.5.0 (2018-04-23)     |
| Platform | x86\_64-w64-mingw32/x64 (64-bit) |
| Running  | Windows \>= 8 x64 (build 9200)   |
| Language | English\_United States           |
| Timezone | Europe/Paris                     |

| Package  | Version |
| :------- | :------ |
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.61  |

</details>

<!--- Final Status : pass --->
