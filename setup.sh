#!/bin/sh

set -e

createFiles() {
    echo "% Warning: This is an auto-generated file. To regenerate it, use the setup script.
% This file is used as import for generating the summaries
\\input{$1/janishutz-helpers.tex}" >./helpers.tex

    echo "% Warning: This is an auto-generated file. To regenerate it, use the setup script.
% This file is used as import for generating the older summaries
\\input{$1/old/janishutz-helpers-v1.tex}" >./helpers-old.tex
}

echo "
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
██░▄▄▄█▄▄░▄▄██░██░█████░▄▄▄░█░██░█░▄▀▄░█░▄▀▄░█░▄▄▀█░▄▄▀██▄██░▄▄█░▄▄
██░▄▄▄███░████░▄▄░█▄▄██▄▄▄▀▀█░██░█░█▄█░█░█▄█░█░▀▀░█░▀▀▄██░▄█░▄▄█▄▄▀
██░▀▀▀███░████░██░█████░▀▀▀░██▄▄▄█▄███▄█▄███▄█▄██▄█▄█▄▄█▄▄▄█▄▄▄█▄▄▄
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

                        -> Basic Setup <-
                    -----------------------

    => This script will link the LaTeX helpers to the build import
"

read -p "Do you want to use the provided git submodule for the compilation? (Y/n) " usesubmodule

if [[ $usesubmodule != 'n' ]]; then
    if git submodule status | grep --quiet '^-'; then
        echo "Submodule not yet initialized, initializing..."
    else
        echo "Submodule already set up"
    fi
    createFiles $(pwd)/latex-helpers
else
    read -e -p "Where are the helper files located (absolute path to folder only, tab-completion enabled)? " helperpath

    if [[ ${helperpath:0:1} == '/' ]]; then
        createFiles $helperpath
    elif [[ ${helperpath:0:1} == '~' ]]; then
        helperpath=$(readlink -f $helperpath)
        createFiles $helperpath
    else
        echo "Note: You did not enter an absolute path, it was expanded automatically"
        helperpath=$(readlink -f $(pwd)/$helperpath)
        createFiles $helperpath
    fi
    echo "
    => Path was set to $helperpath
    => If you entered also the file name, rerun this script, the compile will fail in that case.
    "
fi
