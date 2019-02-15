# GitHub Actions

### branch-filter action
It is used to filter and decide which branches should proceed to the next action.
*Example*:
```bash
action "Filter Branch" {
  uses = "docker://patrykwozinski/github-actions:branch-filter-latest"
  args = "'master|dev'"
}
```

### phpstan action
Used to call actions related to static code analysis using PHPStan. We point to the `phpstan.neon` file and pass two environment variables:` BRANCH` and `FILTERS`.
*Example*:
```bash
action "PHP Stan" {
  uses = "docker://patrykwozinski/github-actions:phpstan-latest"
  args = "-c ./phpstan.neon
  env = {
      BRANCH = "origin/dev"
      FILTERS = "'*.php'"
    }
}
```
If you need to check if `Filter branch` was successfully checked - you need to add: `needs = ["Filter Branch"]`.

### php-cs-fixer action
It is used to trigger actions related to the analysis of coding standards using PHP Code Sniffer Fixed. We point to a file with the `.phpcs` configuration and additional optional arguments and we pass two environment variables:` BRANCH` and `FILTERS`.
*Example*:
```bash
action "PHP CS Fixer" {
  uses = "docker://patrykwozinski/github-actions:php-cs-fixer-latest"
  args = "--config=.php_cs.dist --diff --dry-run"
  needs = ["Filter Branch"]
  env = {
    BRANCH = "origin/dev"
    FILTERS = "'*.php'"
  }
}
```
If you need to check if `Filter branch` was successfully checked - you need to add: `needs = ["Filter Branch"]`.
