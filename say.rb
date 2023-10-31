# frozen_string_literal: true

# This class defines a Homebrew formula for the 'say' command-line tool.
class Say < Formula
  url 'https://github.com/8ta4/say/releases/download/v0.1.1/say.tar.gz'
  sha256 '76af82e7bed3dec70f0383fc4d9f2c23e92abd2ae31f3bf9c521b7911fc84507'

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

  def post_install
    cd libexec do
      ENV['PIPENV_VENV_IN_PROJECT'] = 'True'
      system 'pipenv', 'install'
    end
  end
end
