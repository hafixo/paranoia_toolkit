#!/bin/bash

git update-index --assume-unchanged res/values/git-rev.xml
echo '<?xml version="1.0" encoding="utf-8"?>' > res/values/git-rev.xml
echo '<resources>' >> res/values/git-rev.xml
echo -n '<string name="git_revisions">' >> res/values/git-rev.xml
echo -n '<b>Version information:</b> ' $*_endl| sed -e s/_endl/'\\n'/ >> res/values/git-rev.xml
echo -n '<b>paranoia:</b>' $(git log --abbrev-commit --pretty=oneline -1) _endl\
'<b>engine:</b>' $(cd jni/xash3d;git log --abbrev-commit --pretty=oneline -1) _endl\
'<b>nanogl:</b>' $(cd jni/nanogl;git log --abbrev-commit --pretty=oneline -1) _endl\
ls | sed -e s/\'//g -e s/_endl/'\\n'/g >> res/values/git-rev.xml
echo -n $USER@$(hostname) $(date +%H:%M:%S-%d-%m-%y) >> res/values/git-rev.xml
echo '</string>' >> res/values/git-rev.xml
echo '</resources>' >> res/values/git-rev.xml
cat res/values/git-rev.xml
