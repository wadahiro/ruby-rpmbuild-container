#!/bin/env bash
HOME=/opt/rpmbuild

RUBY_VER=${RUBY_VER:-"2.1.2"}

RUBY_MAJOUR_VER=`echo $RUBY_VER|cut -d"-" -f1`
RUBY_TARBALL="ruby-$RUBY_VER.tar.gz"

RUBY_REMOTE_FILE="http://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOUR_VER:0:3}/$RUBY_TARBALL"

mkdir -p $HOME/rpm/{BUILD,SRPMS,SPECS,SOURCES,RPMS}
echo "%_topdir $HOME/rpm" > ~/.rpmmacros
if [ ! -f $HOME/rpm/SOURCES/$RUBY_TARBALL ]; then
  curl $RUBY_REMOTE_FILE -o $HOME/rpm/SOURCES/$RUBY_TARBALL
fi
cp $HOME/ruby-${RUBY_VER}.spec $HOME/rpm/SPECS/ruby.spec
rpmbuild -bb $HOME/rpm/SPECS/ruby.spec

cp $HOME/rpm/RPMS/x86_64/* /shared/
