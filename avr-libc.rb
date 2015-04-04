require 'formula'

class AvrLibc < Formula

    homepage 'http://www.nongnu.org/avr-libc/'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.4.5/avr-libc-1.8.0.tar.bz2'
    sha256 '50cc44ab106abadf0a11f7ce81af68d6706fcf14bcb50cbe7c4b48090a3e7314'

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
            system "../configure", "--build=#{build}", "--prefix=#{prefix}", "--host=avr"
            system "make"
            system "make install"
        end

        avr = File.join prefix, 'avr'

        # copy include and lib files where avr-gcc searches for them
        # this wouldn't be necessary with a standard prefix
        ohai "copying #{avr} -> #{avr_gcc.prefix}"
        cp_r avr, avr_gcc.prefix

    end
end
