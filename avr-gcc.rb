require 'formula'

# print avr-gcc's builtin include paths
# `avr-gcc -print-prog-name=cc1plus` -v

class AvrGcc < Formula

    homepage 'http://www.gnu.org/software/gcc/gcc.html'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.4.5/avr-gcc-4.8.1.tar.bz2'
    sha256 '6341fa47471a10bcf2a96c748e3333507e7d00866b210199444e4a59868b284c'

    depends_on 'gmp'
    depends_on 'libmpc'
    depends_on 'mpfr'
    depends_on 'cloog'
    depends_on 'isl011'

    depends_on 'avr-binutils'

    option 'disable-cxx', 'Don\'t build the g++ compiler'

    def install
        # The C compiler is always built, C++ can be disabled
        languages = %w[c]
        languages << 'c++' unless build.include? 'disable-cxx'

        args = [
            "--target=avr",
            "--prefix=#{prefix}",

            "--enable-languages=#{languages.join(',')}",
            "--with-gnu-as",
            "--with-gnu-ld",
            "--with-ld=#{Formula["avr-binutils"].opt_bin/'avr-ld'}",
            "--with-as=#{Formula["avr-binutils"].opt_bin/'avr-as'}",

            "--disable-nls",
            "--disable-threads",
            "--disable-libssp",
            "--disable-libstdcxx-pch",
            "--disable-libgomp",

            "--with-gmp=#{Formula["gmp"].opt_prefix}",
            "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
            "--with-mpc=#{Formula["libmpc"].opt_prefix}",
            "--with-cloog=#{Formula["cloog"].opt_prefix}",
            "--with-isl=#{Formula["isl"].opt_prefix}",
            "--with-system-zlib"
        ]

        mkdir 'build-gcc' do
            system "../configure", *args
            system "make"

            ENV.deparallelize
            system "make install"
        end

        # info and man7 files conflict with native gcc
        info.rmtree
        man7.rmtree
    end
end

