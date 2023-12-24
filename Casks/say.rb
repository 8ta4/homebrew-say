# frozen_string_literal: true

cask 'say' do
  version '0.3.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'e2df83f37a0e888f50bd381bb1f01d20b7d27f511f201861a99a293f308ee8d4'
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
