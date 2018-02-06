#!/bin/bash
AUTHORNAME="Steph"
AUTHOREMAIL="Steph@itsalocke.com"
GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"
DESTURL="https://$GITHUB_PAT@github.com/lockedatapublished/slides.git"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

R CMD BATCH './buildpres.R'
mkdir docs/$TRAVIS_REPO_SLUG
cp buildpres.Rout docs/$TRAVIS_REPO_SLUG

cd ../..
git clone $DESTURL
cp -r $TRAVIS_REPO_SLUG/docs/* slides/static
git add slides/static
git commit -m "Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
