#!/bin/sh

git filter-branch -f --env-filter '
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_AUTHOR_EMAIL" = "原作者邮箱" ]
then
an="新作者名称"
am="新作者邮箱"
fi

if [ "$GIT_COMMITTER_EMAIL" = "原提交者邮箱" ]
then
cn="新提交者名称"
cm="新提交者邮箱"
fi

export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
'
