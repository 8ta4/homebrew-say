# frozen_string_literal: true

cask 'say' do
  version '0.6.1'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '6b8985c767861c47591cffa4614dbaea3a3d04f56f683d2aeab7e9546c780884'
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
