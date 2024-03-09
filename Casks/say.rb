# frozen_string_literal: true

cask 'say' do
  version '0.8.1'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'b3797fb27f82022e3e4c5d0ad314009a2fea3a151a2355e0b1f11e74810a96d0'
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
