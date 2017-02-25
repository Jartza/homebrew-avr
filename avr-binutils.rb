require 'formula'

class AvrBinutils < Formula

    homepage 'http://www.gnu.org/software/binutils/binutils.html'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.5.4/avr-binutils.tar.bz2'
    sha256 '11c1700ca0e80be28548eaaa4d1e245804b9fb5cc1686accae42df4ab3a4db6a'

    depends_on 'autoconf'
    depends_on 'automake'

    def install
        args = [
            "--disable-debug",
            "--disable-dependency-tracking",
            "--target=avr",
            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--disable-werror",
            "--disable-nls"
        ]

        mkdir 'build-binutils' do
            system "../configure", *args
            system "make"
            system "make install"
        end

        info.rmtree # info files conflict with native binutils
    end
end
