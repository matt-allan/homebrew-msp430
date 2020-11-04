class Msp430Gcc < Formula
  desc "Open source compiler for MSP microcontrollers"
  homepage "https://www.ti.com/tool/MSP430-GCC-OPENSOURCE"
  url "https://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/9_2_0_0/export/msp430-gcc-9.2.0.50_macos.tar.bz2"
  sha256 "fe244ccfabf544e3604d135a84e015cc2ce9df335733e114c99b6e88c25fd61a"
  license "GPL-3.0-only"

  def install
    bin.install Dir["bin/*"]
    include.install Dir["include/*"]
    lib.install Dir["lib/*"]
    libexec.install Dir["libexec/*"]
    share.install Dir["share/*"]
    prefix.install "msp430-elf"
  end

  test do
    (testpath/"test.c").write <<~EOS
      int main() {
        return 0;
      }
    EOS
    system "#{bin}/msp430-elf-gcc", "test.c", "-o", "test"
  end
end
