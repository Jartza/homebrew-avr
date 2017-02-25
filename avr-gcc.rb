require 'formula'

# print avr-gcc's builtin include paths
# `avr-gcc -print-prog-name=cc1plus` -v

class AvrGcc < Formula

    homepage 'http://www.gnu.org/software/gcc/gcc.html'
    url 'http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/3.5.4/avr-gcc.tar.bz2'
    sha256 'aef6485df226c9bfb9a3c986f98bc1de3ab4e36f8fdae660ac17708fba6273a4'

    depends_on 'gmp'
    depends_on 'libmpc'
    depends_on 'mpfr'
    depends_on 'cloog'
    depends_on 'homebrew/versions/isl011'

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
            "--disable-install-libiberty",

            "--with-gmp=#{Formula["gmp"].opt_prefix}",
            "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
            "--with-mpc=#{Formula["libmpc"].opt_prefix}",
            "--with-cloog=#{Formula["cloog"].opt_prefix}",
            "--with-isl=#{Formula["isl011"].opt_prefix}",
            "--with-system-zlib"
        ]

        mkdir 'build-gcc' do
            system "../configure", *args
            system "make"

            ENV.deparallelize
            system "make install"

            multios = `gcc --print-multi-os-directory`.chomp
            File.unlink "#{prefix}/lib/#{multios}/libiberty.a"
        end

        # info and man7 files conflict with native gcc
        info.rmtree
        man7.rmtree
    end
end

