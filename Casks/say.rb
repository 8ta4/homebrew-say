# frozen_string_literal: true

cask 'say' do
  version '0.5.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '9ac5affddc4b7a1630401c4ba1a4ef1d5e903c4f021e8e62d9518801b5a12bb7'
  depends_on formula: 'ffmpeg'
  depends_on cask: 'visual-studio-code'
  app 'say.app'

  # Workaround for the error: "say.app is damaged and can't be opened. You should move it to the Trash."
  # This error occurs when opening the app.
  # The following command clears the extended attributes of the file, resolving the issue.
  postflight do
    system 'xattr', '-c', "#{appdir}/say.app"
  end
end
