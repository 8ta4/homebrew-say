# frozen_string_literal: true

cask 'say' do
  version '0.8.2'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '2832cfde87ef0b99a0087d2f9fa1f8ee6fc1568541d11c70ffeedb13ecf81f08'
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
