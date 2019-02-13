FROM debian:9.5-slim

LABEL "com.github.actions.name"="Branch filter"
LABEL "com.github.actions.description"="Filter by not specific branch"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/patrykwozinski/github-actions/branch-filter"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
