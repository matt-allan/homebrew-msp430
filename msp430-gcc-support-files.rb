class Msp430GccSupportFiles < Formula
  desc "Header and support files for MSP microcontrollers"
  homepage "https://www.ti.com/tool/MSP430-GCC-OPENSOURCE"
  url "https://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/9_2_0_0/export/msp430-gcc-support-files-1.210.zip"
  sha256 "eeedbfc7b1775e06e44c65d38977f998f6a9ee46b1a4cfcc194181c44bbd8911"
  license "GPL-3.0-only"

  def install
    include.install Dir["include/*"]
  end

  def caveats
    <<~EOS
      It is recommended that you set the environment variable 'MSP430_GCC_INCLUDE_DIR' to
        #{include}
    EOS
  end

  test do
    assert_predicate include/"devices.csv", :exist?
  end
end
