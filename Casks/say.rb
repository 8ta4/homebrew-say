# frozen_string_literal: true

cask 'say' do
  version '0.9.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '4a66cfb20bb3cf76c9a4f55f42551bcf4d15c82fab67c0349c852c3af28b3148'
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
