autovenv.sh: auto sourcing of virtual environments
==================================================

autovenv.sh is a bash script that sets up easy to use shortcuts and 
automagically activates and deactivates your environment depending on
what project you are working on. This script also has functions
that can be used to aids in customizing your PS1 prompt.

Who's this for?
---------------
Anyone who uses pip and virtualenv for python development and
like packaging the environment in the root directory of the project.

Prerequisites
-------------
 - bash shell
 - python pip
 - virtualenv
 - packaging the environment in root directory of project
 - calling the virtual environment venv

Usage
-----
Add the line `source autovenv.sh` in your .bashrc file.

Last two lines of autovenv.sh
-----------------------------
`export PROMPT_COMMAND="autovenv-command-loader"` does all 
the magic to auto source environment

`export PS1='$(autovenv-prompt-loader && echo "\n")'$PS1` to 
customize prompt.


List of commands
----------------
 - venv-init - create new venv environment in current directory. 
 - venv-freeze - get list of installed packages in current environment.
 - venv-make - build package and ignore all its dependencies. Nice for package development.
 - venv-makeall - build package and all its dependencies.
 - venv-home - cd into the last known good project with a working environment.
