# frozen_string_literal: true

# This class defines a Homebrew formula for the 'say' command-line tool.
class Say < Formula
  url 'https://github.com/8ta4/say/releases/download/v0.1.0/say.tar.gz'
  sha256 '2e4e41ed118f13b87ae46967bd6abbb2bc4bba110cdb34cc3617e33f4f5803b9'
  version '0.1.0'

  depends_on 'haskell-stack' => :build
  depends_on 'pipenv' => :build
  depends_on 'lame'
  depends_on 'openjdk@17'
  depends_on 'portaudio'
  depends_on 'python@3.10'

  def install
    libexec.install Dir['*']
    cd libexec / 'hs' do
      system 'stack', '--local-bin-path', '.', 'install'
    end
    bin.install_symlink libexec / 'hs/say'
  end

  def post_install
    cd libexec do
      ENV['PIPENV_VENV_IN_PROJECT'] = 'True'
      system 'pipenv', 'install'
    end
  end
end
