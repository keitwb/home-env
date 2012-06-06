#My Homedir Essentials

A (hopefully) portable collection of dot and bin files that I can use to create
a consistent environment on whatever machines I have an account.  

##Usage
After the repo has been cloned somewhere on the target machine (the location of
the working copy does not matter), run `setup.sh` and homedir of the currently
logged in user will be set up appropriately.  For local machine specific
configuration, create a file `~/.bashrc-local` and `.bashrc` will source it.
