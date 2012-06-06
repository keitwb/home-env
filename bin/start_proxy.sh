#!/bin/bash
ssh -C2qTnN -D $1 -v -p 2222 keitwb.dyndns.org
