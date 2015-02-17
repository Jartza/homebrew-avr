require 'formula'

class AvrdudeAttiny841 < Formula
    url 'https://raw.githubusercontent.com/Jartza/homebrew-avr/master/patches/avrdude/avrduderc.tgz'
    version '0.1'
    depends_on 'avrdude'

    def install
        mkdir 'build' do
            system "cat ../avrduderc >> ~/.avrduderc"
        end

    end
end
