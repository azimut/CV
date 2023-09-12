#!/bin/bash

set -exuo pipefail

project=$1
file=tmp/${project}

mkdir -p tmp/

if [[ $(find ./tmp/ -name "$project" -mtime -1 -print) ]]; then
    cat ${file}
    exit 0
fi

jqerlang() { jq -j '.Erlang.code'; }
jqgo()     { jq -j '.Go.code'; }
jqbash()   { jq -j '."Bourne Shell".code'; }
jqcl()     { jq -j '.Lisp.code'; }
jqrust()   { jq -j '.Rust.code'; }

case ${project} in
    ccache)           jqrust < <(cloc --vcs=git --json $HOME/projects/rust/ccache/src);;
    sunny)            jqgo   < <(cloc --vcs=git --json $HOME/projects/go/sunny) ;;
    lainviewer)       jqgo   < <(cloc --vcs=git --json $HOME/projects/go/lainviewer) ;;
    redditviewer)     jqgo   < <(cloc --vcs=git --json $HOME/projects/go/redditviewer) ;;
    github-rss)       jqgo   < <(cloc --vcs=git --json $HOME/projects/go/github-rss) ;;
    4chan-rss)        jqgo   < <(cloc --vcs=git --json $HOME/projects/go/4chan-rss) ;;
    autoaim)          jqbash < <(cloc --vcs=git --json $HOME/projects/sec/autoaim) ;;
    daily-pic)        jqbash < <(cloc --vcs=git --json $HOME/projects/daily-pic) ;;
    kubler-dock)      jqbash < <(cloc --vcs=git --json $HOME/projects/kubler-dock)  ;;
    launchpad-csound) jqcl   < <(cloc --vcs=git --json $HOME/projects/cl/launchpad-csound) ;;
    rocketman)        jqcl   < <(cloc --vcs=git --json $HOME/projects/cl/rocketman) ;;
    incandescent)     jqcl   < <(cloc --vcs=git --json $HOME/projects/cl/incandescent) ;;
    shiny)            jqcl   < <(cloc --vcs=git --json $HOME/projects/cl/shiny) ;;
    scenic)           jqcl   < <(cloc --vcs=git --json $HOME/projects/cl/scenic) ;;
esac | tee ${file}
