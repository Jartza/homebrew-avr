homebrew-avr
============

This repository contains the "official" Atmel GNU AVR Toolchain as
formulae for [Homebrew][].

Additional configuration for avrdude for Attiny841 is also included.

AVR is a popular family of microcontrollers, used for example in the
[Arduino][] project.

Current Versions
----------------

- `gcc 4.8.1` with Atmel patches
- `binutils 2.24` with Atmel patches
- `avr-libc 1.8.0` with Atmel patches 

Supported MCUs:
---------------
at43usb320 at43usb355 at76c711 at86rf401 at90c8534 at90can128 at90can32 at90can64 at90pwm1 at90pwm161 at90pwm2 at90pwm216 at90pwm2b at90pwm3 at90pwm316 at90pwm3b at90pwm81 at90s1200 at90s2313 at90s2323 at90s2333 at90s2343 at90s4414 at90s4433 at90s4434 at90s8515 at90s8535 at90scr100 at90usb1286 at90usb1287 at90usb162 at90usb646 at90usb647 at90usb82 at94k ata5272 ata5505 ata5702m322 ata5782 ata5790 ata5790n ata5795 ata5831 ata6285 ata6286 ata6289 ata6612c ata6613c ata6614q ata6616c ata6617c ata664251 atmega103 atmega128 atmega1280 atmega1281 atmega1284 atmega1284p atmega1284rfr2 atmega128a atmega128rfa1 atmega128rfr2 atmega16 atmega161 atmega162 atmega163 atmega164a atmega164p atmega164pa atmega165 atmega165a atmega165p atmega165pa atmega168 atmega168a atmega168p atmega168pa atmega168pb atmega169 atmega169a atmega169p atmega169pa atmega16a atmega16hva atmega16hva2 atmega16hvb atmega16hvbrevb atmega16m1 atmega16u2 atmega16u4 atmega2560 atmega2561 atmega2564rfr2 atmega256rfr2 atmega32 atmega323 atmega324a atmega324p atmega324pa atmega325 atmega3250 atmega3250a atmega3250p atmega3250pa atmega325a atmega325p atmega325pa atmega328 atmega328p atmega329 atmega3290 atmega3290a atmega3290p atmega3290pa atmega329a atmega329p atmega329pa atmega32a atmega32c1 atmega32hvb atmega32hvbrevb atmega32m1 atmega32u2 atmega32u4 atmega32u6 atmega406 atmega48 atmega48a atmega48p atmega48pa atmega48pb atmega64 atmega640 atmega644 atmega644a atmega644p atmega644pa atmega644rfr2 atmega645 atmega6450 atmega6450a atmega6450p atmega645a atmega645p atmega649 atmega6490 atmega6490a atmega6490p atmega649a atmega649p atmega64a atmega64c1 atmega64hve atmega64hve2 atmega64m1 atmega64rfr2 atmega8 atmega8515 atmega8535 atmega88 atmega88a atmega88p atmega88pa atmega88pb atmega8a atmega8hva atmega8u2 attiny10 attiny11 attiny12 attiny13 attiny13a attiny15 attiny1634 attiny167 attiny20 attiny22 attiny2313 attiny2313a attiny24 attiny24a attiny25 attiny26 attiny261 attiny261a attiny28 attiny4 attiny40 attiny4313 attiny43u attiny44 attiny441 attiny44a attiny45 attiny461 attiny461a attiny48 attiny5 attiny828 attiny84 attiny841 attiny84a attiny85 attiny861 attiny861a attiny87 attiny88 attiny9 atxmega128a1 atxmega128a1u atxmega128a3 atxmega128a3u atxmega128a4u atxmega128b1 atxmega128b3 atxmega128c3 atxmega128d3 atxmega128d4 atxmega16a4 atxmega16a4u atxmega16c4 atxmega16d4 atxmega16e5 atxmega192a3 atxmega192a3u atxmega192c3 atxmega192d3 atxmega256a3 atxmega256a3b atxmega256a3bu atxmega256a3u atxmega256c3 atxmega256d3 atxmega32a4 atxmega32a4u atxmega32c3 atxmega32c4 atxmega32d3 atxmega32d4 atxmega32e5 atxmega384c3 atxmega384d3 atxmega64a1 atxmega64a1u atxmega64a3 atxmega64a3u atxmega64a4u atxmega64b1 atxmega64b3 atxmega64c3 atxmega64d3 atxmega64d4 atxmega8e5 avr1 avr2 avr25 avr3 avr31 avr35 avr4 avr5 avr51 avr6 avrtiny avrxmega2 avrxmega4 avrxmega5 avrxmega6 avrxmega7 m3000

Installing homebrew-avr formulae
--------------------------------

First, just `brew tap Jartza/homebrew-avr` and then `brew install <formula>`.

To install the entire AVR toolchain, do:

```Bash
# to tap the repository
$ brew tap Jartza/homebrew-avr

# to install the avr-gcc & avr-libc & avr-binutils
# This will pull in the prerequisites `avr-binutils` and `avr-gcc`.
$ brew install avr-libc

# OPTIONAL: add Attiny841 to your avrdude (adds to your ~/.avrduderc)
$ brew install avrdude-attiny841

```

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

