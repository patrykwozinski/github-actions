FROM alpine:latest

LABEL "com.github.actions.name"="LCF"
LABEL "com.github.actions.description"="List and save changed files"
LABEL "com.github.actions.icon"="filter"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="http://github.com/patrykwozinski/github-actions/list-changed-files"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Patryk Woziński <patryk.wozinski@gmail.com>"

RUN apk add --update git jq && rm -rf /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
