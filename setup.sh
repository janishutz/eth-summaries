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
    createFiles $helperpath
    echo "Helpers set up. You may experience issues if you have not entered an absolute path. If so, simply rerun this script to regenerate the files!"
fi
