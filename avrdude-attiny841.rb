require 'formula'

class AvrdudeAttiny841 < Formula
    url 'https://github.com/Jartza/homebrew-avr/raw/master/patches/avrdude/avrdude.tgz'
    version '0.1'
    depends_on 'avrdude'

    def install
        mkdir 'build' do
            system "cat ../avrduderc >> ~/.avrduderc"
        end

    end
end
