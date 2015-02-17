require 'formula'

class AvrDudeAttiny841 < Formula
    def install
        system "https://raw.githubusercontent.com/Jartza/homebrew-avr/master/patches/avrdude/avrduderc >> ~/.avrduderc"
    end
end
