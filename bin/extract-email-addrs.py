#!/usr/bin/env python2
from email.parser import HeaderParser
from email.utils import getaddresses
import os
import sys


parser = HeaderParser()

def extract_all_addresses(root_dir):
    email_to_name = {}
    for (dirpath, _, filenames) in os.walk(root_dir):
        for file in filenames:
            for (name, email) in extract_addresses(os.path.join(dirpath, file)):
                if email and (email not in email_to_name or not email_to_name[email]):
                    email_to_name[email] = name
    return email_to_name


def extract_addresses(filepath):
    with open(filepath, 'r') as f:
        e = parser.parse(f)
        return getaddresses((e.get_all('From') or []) +
                            (e.get_all('To') or []) +
                            (e.get_all('CC') or []))

def format_for_mutt(email, name):
    if email and name:
        return "%s\t%s" % (email, name)
    if email and not name:
        return "%s" % (email,)
    else:
        return ""

if __name__ == '__main__':
    try:
        root_dir = sys.argv[1]
    except IndexError:
        sys.stderr.write("Root dir must be specified as first arg!\n")
        sys.exit(1)

    addrs = extract_all_addresses(root_dir)
    print "Results"
    print "\n".join([format_for_mutt(k, v) for k,v in addrs.items()])
