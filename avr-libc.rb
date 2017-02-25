require 'formula'

class AvrLibc < Formula

    homepage 'http://www.nongnu.org/avr-libc/'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.5.4/avr-libc.tar.bz2'
    sha256 '104be58d9fc96c0f3c7176bad0df316d1c014574fc5452426f5a3043f4ef648f'

    depends_on 'automake'
    depends_on 'autoconf'
    depends_on 'avr-gcc'

    def install
        ENV.delete 'CFLAGS'
        ENV.delete 'CXXFLAGS'
        ENV.delete 'LD'
        ENV.delete 'CC'
        ENV.delete 'CXX'

        avr_gcc = Formula['avr-gcc']

        system "./bootstrap"

        build = `./config.guess`.chomp

        mkdir 'build-libc' do
            system "../configure", "--build=#{build}", "--prefix=#{Formula["avr-gcc"].prefix}", "--host=avr"
            system "make"
            system "make install"
        end
    end
end
