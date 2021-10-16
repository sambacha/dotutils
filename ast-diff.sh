#!/bin/bash
GRON=/usr/local/bin/gron
DIFF=/usr/bin/diff
# colordiff: https://www.colordiff.org
COLORDIFF=/usr/bin/colordiff

# use colordiff in interactive mode, diff otherwise
if [ -t 1 ]
then
	DIFFER=${COLORDIFF}
else
	DIFFER=${DIFF}
fi

LOCAL="$1"
REMOTE="$2"

"${DIFFER}" -u --label "a/$REMOTE" --label "b/$REMOTE" <( "$GRON" < "$LOCAL" ) <( "$GRON" < "$REMOTE" ) | less
