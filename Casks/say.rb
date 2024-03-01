# frozen_string_literal: true

cask 'say' do
  version '0.6.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '857d252b8e8f2f3c5b3cea430cfd6de3a9c8fb192826d3d3a45b5b98a178875d'
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
