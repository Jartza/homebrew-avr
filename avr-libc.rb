require 'formula'

class AvrLibc < Formula

    url 'http://download.savannah.gnu.org/releases/avr-libc/avr-libc-1.8.1.tar.bz2'
    homepage 'http://www.nongnu.org/avr-libc/'
    sha256 'c3062a481b6b2c6959dc708571c00b0e26301897ba21171ed92acd0af7c4a969'

    depends_on 'automake'
    depends_on 'autoconf'
    depends_on 'avr-gcc'

    patch do
        url "https://raw.githubusercontent.com/Jartza/homebrew-avr/master/patches/avr-libc/tiny441-tiny841.patch"
        sha1 "7d87e67f4c1574b5dd8b7535988127334a5a80ee"
    end


    def install
        ENV.delete 'CFLAGS'
        ENV.delete 'CXXFLAGS'
        ENV.delete 'LD'
        ENV.delete 'CC'
        ENV.delete 'CXX'

        avr_gcc = Formula['avr-gcc']

        build = `./config.guess`.chomp

        system "./configure", "--build=#{build}", "--prefix=#{prefix}", "--host=avr"
        system "make"
        system "make install"

        avr = File.join prefix, 'avr'

        # copy include and lib files where avr-gcc searches for them
        # this wouldn't be necessary with a standard prefix
        ohai "copying #{avr} -> #{avr_gcc.prefix}"
        cp_r avr, avr_gcc.prefix

    end
end
