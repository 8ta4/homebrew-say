# frozen_string_literal: true

# This class defines a Homebrew formula for the 'say' command-line tool.
class Say < Formula
  url 'https://github.com/8ta4/say/releases/download/v0.1.2/say.tar.gz'
  sha256 '498f54779763b50346fe8b7d665061fa98a0a471755bc435ba824939ce914dd9'

  depends_on 'haskell-stack' => :build
  depends_on 'pipenv' => :build

  depends_on 'lame'
  depends_on 'openjdk@17'
  depends_on 'portaudio'
  depends_on 'python@3.10'

  depends_on 'koekeishiya/formulae/skhd'

  def install
    libexec.install Dir['*']
    cd libexec / 'hs' do
      system 'stack', '--local-bin-path', '.', 'install'
    end
    write_script

    # Link the script to the bin directory
    bin.install_symlink libexec / 'say.sh' => 'say'
  end

  def write_script
    (libexec / 'say.sh').write <<~SHELL_SCRIPT
      #!/bin/bash
      source "#{libexec}/.venv/bin/activate"
      JAVA_HOME="$(brew --prefix openjdk@17)" exec "#{libexec}/hs/say" "$@"
    SHELL_SCRIPT

    # Make the script executable
    chmod 0o755, libexec / 'say.sh'
  end

  # The 'pipenv install' command is placed in the 'post_install' method instead of the 'install' method.
  # When 'pipenv install' is run in the 'install' method, it leads to an error when running 'say'.
  # However, when it is run in the 'post_install' method, no such error occurs.
  def post_install
    cd libexec do
      ENV['PIPENV_VENV_IN_PROJECT'] = 'True'
      system 'pipenv', 'install'
    end
  end
end
