#!/usr/bin/python

import argparse
import subprocess
import os


def main():

    parser = argparse.ArgumentParser(description='Vim helper function to checks TIGL code style and outputs the first error line')
    parser.add_argument('-f', '--filename', help='filename', type=str, required=True)
    parser.add_argument('-e', '--error', help='error number', type=int, required=True)
    args = parser.parse_args()
    if args.error < 1:
        print "style check error: Message number must be >=1. %i given." % args.error
        exit(1)

    styleCheckerDir = os.getenv("HOME") + '/.vim/styleChecker/'
    logfile = '%s/output.csv' % styleCheckerDir
    if os.path.exists(logfile):
        os.remove(logfile)
    cmd = "python %s/nsiqcppstyle/nsiqcppstyle.py -o %s --output='csv' -f %s/filefilter.txt %s" % (styleCheckerDir, logfile, styleCheckerDir, args.filename)
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (stdout, stderr) = p.communicate()
    status = p.returncode
    if status or not os.path.exists(logfile):
        print "style check error: Something went wrong during:"
        print cmd
        print "Stdout:"
        print stdout
        print "Stderr:"
        print stderr
        exit(1)
    f = open(logfile, 'r')
    lines = f.readlines()
    f.close()
    if (len(lines) == 1):
        print "style check successful"
    elif (args.error < len(lines)):
        print lines[args.error].rstrip('\n')
    else:
        print "style check error: Message number %i requested, but there are only %i error messages." % (args.error, len(lines) - 1)
        exit(1)


if __name__ == "__main__":
    main()
