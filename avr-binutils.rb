require 'formula'

class AvrBinutils < Formula

    homepage 'http://www.gnu.org/software/binutils/binutils.html'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.4.5/avr-binutils-2.24.tar.bz2'
    sha256 '5bcae964968d310c3ec047469ca405c9cb6cef8c843ca72ff62eedd732c384ff'

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
