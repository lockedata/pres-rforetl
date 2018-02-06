#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"
DESTDIR = "lockedatapublished/slides"
DESTURL="https://$GITHUB_PAT@github.com/$DESTDIR.git"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH './buildpres.R'
LOGDIR="docs/$TRAVIS_REPO_SLUG"
mkdir -p $LOGDIR
cp buildpres.Rout $LOGDIR

cd ../..
git clone $DESTURL
cp -r $TRAVIS_REPO_SLUG/docs/* slides/static
cd $DESTDIR
git add static
git commit -m "Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
