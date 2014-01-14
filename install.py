#!/usr/bin/python
import argparse
import os
import subprocess

parser = argparse.ArgumentParser(description='Install all vim plugins (use after git clone https://github.com/tstollenw/dotvim.git ~/.vim)')
args = parser.parse_args()

def cont(s):
    cont=raw_input("%s - continue(Y/n)?" % s)
    if cont!="n":
        return True
    else:
        return False

def isubuntu():
    cont=raw_input("Standard installation (yes for Ubuntu, no for SLED) (Y/n)?")
    if cont!="n":
        return True
    else:
        return False


def run(cmd):
        subprocess.call(cmd, shell=True)

# Installation:

#git clone https://github.com/tstollenw/dotvim.git ~/.vim

if cont("Initial installation"):
    run("sudo apt-get install cmake g++ vim libpython-dev ctags")

    run("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")

    # Create symlinks:

    run("ln -s ~/.vim/vimrc ~/.vimrc")

    # create temp dir
    run("mkdir -p ~/.vim/tmp/undo")
    run("mkdir -p ~/.vim/tmp/swap")
    run("mkdir -p ~/.vim/tmp/backup")

    # Switch to the `~/.vim` directory, and fetch submodules:

    run("cd ~/.vim")
    run("git submodule init")
    run("git submodule update")
    run("cd -")

    # Install Bundles
    run("vim +BundleInstall +qall")

# Install YouCompleteMe
if cont("Finish YouCompleteMe installation"):
    run("cd ~/.vim/bundle/YouCompleteMe; ./install.sh --clang-completer; cd -")

# Nice powerline symbols:
# Source: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
if cont("Install powerline symbols"):
    if isubuntu():
        # Download the latest version of PowerlineSymbols
        run("wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf ")
        # and the latest version of the fontconfig file
        run("wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf")
        # Move PowerlineSymbols.otf to ~/.fonts/ (or another X font directory).
        run("mkdir -p ~/.fonts/")
        run("mv PowerlineSymbols.otf ~/.fonts/")
        # Run fc-cache -vf ~/.fonts to update your font cache.
        run("fc-cache -vf ~/.fonts")
        # Move 10-powerline-symbols.conf to either ~/.fonts.conf.d/ or ~/.config/fontconfig/conf.d/, depending on your fontconfig version.
        run("mkdir -p .config/fontconfig/conf.d/")
        run("mv 10-powerline-symbols.conf .config/fontconfig/conf.d/")
        # If you don't see the arrow symbols, please close all instances of your terminal emulator or gvim. 
        # You may also have to restart X for the changes to take effect. 

    else:
        # Download the latest version of PowerlineSymbols
        run("git clone https://github.com/Lokaltog/powerline-fonts.git")
        # Move patched fonts to ~/.fonts/ (or another X font directory).
        run("mv powerline-fonts/DejaVuSansMono/*.ttf ~/.fonts/")
        # Run fc-cache -vf ~/.fonts to update your font cache.
        run("fc-cache -vf ~/.fonts")
        # clean up
        run("rm -rf powerline-fonts")
        # If you don't see the arrow symbols, please close all instances of your terminal emulator or gvim. 
        # You may also have to restart X for the changes to take effect. 
