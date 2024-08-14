# frozen_string_literal: true

cask 'say' do
  version '0.9.1'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'b423a515d4307cb2a6434bd6b71df0e80e367ef8485bdf967e35ba647b2241cb'
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
