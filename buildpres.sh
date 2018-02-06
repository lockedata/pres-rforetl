#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"
DESTDIR="slides"
DESTURL="https://$GITHUB_PAT@github.com/lockedatapublished/$DESTDIR.git"
LOGDIR="docs/$TRAVIS_REPO_SLUG"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH './buildpres.R'
mkdir -p $LOGDIR
cp buildpres.Rout $LOGDIR

cd ../..
git clone $DESTURL
cp -r $TRAVIS_REPO_SLUG/docs/* slides/static
cd $DESTDIR
git add static
git commit -m "Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
