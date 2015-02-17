require 'formula'

class AvrDudeAttiny841 < Formula
    depends_on 'avrdude'

    def install
        system "https://raw.githubusercontent.com/Jartza/homebrew-avr/master/patches/avrdude/avrduderc >> ~/.avrduderc"
    end
end
