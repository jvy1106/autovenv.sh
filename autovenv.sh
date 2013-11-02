#autovenv.sh - to use all its magic source from your .bashrc
#created by: Jesse Yen jesse@jads.com

function autovenv-prompt-loader {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        project_path="$(dirname $VIRTUAL_ENV)"
        echo -e "$(basename $project_path)"
    fi
}

function autovenv-command-loader {
    venv="$(pwd)/venv"
    if [[ -d "$venv" ]] && [[ -z "$VIRTUAL_ENV" ]]; then
        OLD_PS1=$PS1
        . $venv/bin/activate
        export PS1=$OLD_PS1
        #setup some alias shortcuts
        alias venv-freeze="pip freeze"
        alias venv-make="pip install -I --no-deps"
        alias venv-makeall="pip install -I"
        alias venv-home="cd $(dirname $VIRTUAL_ENV)"
    elif [[ -n "$VIRTUAL_ENV" ]] && [[ "$(pwd)" != "$(dirname $VIRTUAL_ENV)"* ]]; then
        unalias venv-freeze
        unalias venv-make
        unalias venv-makeall
        deactivate
    fi
}

#global aliases
alias venv-init="virtualenv venv --distribute"

export PROMPT_COMMAND="autovenv-command-loader"
export PS1='$(autovenv-prompt-loader && echo "\n")'$PS1
