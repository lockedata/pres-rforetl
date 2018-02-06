#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"
DESTURL="https://github.com/lockedatapublished/slides.git"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH './buildpres.R'
cp buildpres.Rout docs/$(dirname `pwd`).Rout

cd ..
git clone $DESTURL
cp $TRAVIS_REPO_SLUG/docs/* slides/static
git add slides/static
git commit -m "Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
