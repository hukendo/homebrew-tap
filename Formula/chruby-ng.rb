class ChrubyNg < Formula
  desc "Ruby environment tool"
  homepage "https://github.com/hukendo/chruby#readme"
  url "https://github.com/hukendo/chruby/archive/v0.4.1.tar.gz"
  sha256 "4ced1bc16a6b8d19ab073a4a8264a368e45b054a22fc0125ffc8ba4aa5a97ced"

  head "https://github.com/hukendo/chruby.git"


  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bashrc or ~/.zshrc file:

      source #{opt_share}/chruby/chruby.sh

    By default chruby will search for Rubies installed into /opt/rubies/ or
    ~/.rubies/. For non-standard installation locations, simply set the RUBIES
    variable after loading chruby.sh:

      RUBIES+=(
        /opt/jruby-1.7.0
        $HOME/src/rubinius
      )

    If you are migrating from another Ruby manager, set `RUBIES` accordingly:

      RVM:   RUBIES+=(~/.rvm/rubies/*)
      rbenv: RUBIES+=(~/.rbenv/versions/*)
      rbfu:  RUBIES+=(~/.rbfu/rubies/*)

    To enable auto-switching of Rubies specified by .ruby-version files,
    add the following to ~/.bashrc or ~/.zshrc:

      source #{opt_share}/chruby/auto.sh
    EOS
  end
end
