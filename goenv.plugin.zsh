# SPDX-License-Identifier: MIT
goenvdirs=("$HOME/.goenv" "/usr/local/bin/goenv" "/usr/local/goenv" "/opt/goenv")

FOUND_GOENV=0
for goenvdir in $goenvdirs; do
    if [[ -d "${goenvdir}/bin" ]]; then
        FOUND_GOENV=1
        break
    fi
done

if [[ $FOUND_GOENV -eq 0 ]]; then
    if (( $+commands[brew] )) && goenvdir="$(brew --prefix goenv)"; then
        [[ -d "${goenvdir}/bin" ]] && FOUND_GOENV=1
    fi
fi

if [[ $FOUND_GOENV -eq 1 ]]; then
    (( $+commands[goenv] )) || export PATH="${goenvdir}/bin:$PATH"
    eval "$(goenv init - zsh)"

    function goenv_prompt_info() {
      local version="$(goenv version-name 2>/dev/null)"
      echo "${version:gs/%/%%}"
    }

    if [[ -d "${goenvdir}/versions" ]]; then
        export GOENV_ROOT=$goenvdir
    fi
else
    function goenv_prompt_info() {
      local version="$(go version | cut -d' ' -f3)"
      echo "${version:gs/%/%%}"
    }
fi

unset goenvdir goenvdirs FOUND_GOENV
