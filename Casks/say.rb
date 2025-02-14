# frozen_string_literal: true

cask 'say' do
  version '0.9.3'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'c73df3e951682cd5e604b6d0e332bffa9fd798a9b61fcad71cd2ce268d02f8c8'
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
