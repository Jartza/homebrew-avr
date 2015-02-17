homebrew-avr
============

This repository contains the GNU AVR Toolchain as formulae for
[Homebrew][]. Added are the patches for Attiny841.

AVR is a popular family of microcontrollers, used for example in the
[Arduino][] project.

Forked because I need support for the attiny841.

Current Versions
----------------

- `gcc 4.9.2`
- `binutils 2.25.0`
- `avr-libc 1.8.1`

Installing homebrew-avr formulae
--------------------------------

First, just `brew tap Jartza/homebrew-avr` and then `brew install <formula>`.

To install the entire AVR toolchain, do:

```Bash
# to tap the repository
$ brew tap Jartza/homebrew-avr

# to install the avr-gcc
$ brew install avr-libc
```

This will pull in the prerequisites `avr-binutils` and `avr-gcc`.

Docs
----

`brew help`, `man brew`, or the Homebrew [wiki][].

Thanks
------

This repository is based on the works of:

- [larsimmisch](https://github.com/larsimmisch/homebrew-avr)
- [plietar](https://github.com/plietar/homebrew-avr/)
- [0xPIT](https://github.com/0xPIT/homebrew-avr)
- [fmfi-svt-gate](https://github.com/fmfi-svt-gate/avr-toolchain-patches)


[Homebrew]: https://github.com/mxcl/homebrew
[Arduino]: http://arduino.cc
[wiki]: http://wiki.github.com/mxcl/homebrew

