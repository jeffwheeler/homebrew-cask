cask "wine-stable" do
  version "8.0"
  sha256 "d483dca9562a927db502dbf8e10f777f04e39028582256c8f1939dac99794ebd"

  # Current winehq packages are deprecated and these are packages from
  # the new maintainers that will eventually be pushed to Winehq.
  # See https://www.winehq.org/pipermail/wine-devel/2021-July/191504.html
  url "https://github.com/Gcenx/macOS_Wine_builds/releases/download/#{version}/wine-stable-#{version}-osx64.tar.xz",
      verified: "https://github.com/Gcenx/macOS_Wine_builds/"
  name "WineHQ-stable"
  desc "Compatibility layer to run Windows applications"
  homepage "https://wiki.winehq.org/MacOS"

  # See https://bugs.winehq.org/show_bug.cgi?id=52354
  livecheck do
    # url "https://github.com/Gcenx/macOS_Wine_builds/releases/"
    # regex(/wine[._-]stable[._-]v?(\d+(?:\.\d+)+)[._-]osx64\.t/i)
    # strategy :page_match
    skip "Stable builds are currently blocked by an upstream bug"
  end

  conflicts_with cask: [
    "wine-devel",
    "wine-staging",
  ]

  app "Wine Stable.app"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/start/bin/appdb"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/start/bin/winehelp"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/msiexec"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/notepad"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/regedit"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/regsvr32"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wine"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wine64"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineboot"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winecfg"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineconsole"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winedbg"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winefile"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winemine"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winepath"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineserver"

  caveats <<~EOS
    #{token} supports both 32-bit and 64-bit. It is compatible with an existing
    32-bit wine prefix, but it will now default to 64-bit when you create a new
    wine prefix. The architecture can be selected using the WINEARCH environment
    variable which can be set to either win32 or win64.

    To create a new pure 32-bit prefix, you can run:
      $ WINEARCH=win32 WINEPREFIX=~/.wine32 winecfg

    See the Wine FAQ for details: https://wiki.winehq.org/FAQ#Wineprefixes
  EOS
end
