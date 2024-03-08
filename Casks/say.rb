# frozen_string_literal: true

cask 'say' do
  version '0.8.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '3c73fdc9de57c2774419bbeb29603b7917ad4a8bba7fef0c8ad425e9707795c4'
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
