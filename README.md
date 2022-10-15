# zsh-goenv

A zsh plugin for goenv based on the jenv plugin.

## Usage

To use it, install [`goenv`](https://github.com/syndbg/goenv) first.

Then clone this repository into the custom plugins directory as `goenv` of your
zsh plugin manager which is `$ZSH_CUSTOM`, the following is for
[Oh My Zsh](https://ohmyz.sh/) which is `~/.oh-my-zsh/custom/plugins`.

```bash
git clone https://github.com/TwoPizza9621536/zsh-goenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/goenv
```

Finally, add goenv to the plugins array of your zshrc file:

```bash
plugins=(... goenv)
```

## License

Under the MIT License with the following SPDX expression:

```text
SPDX-License-Identifier: MIT
```
