# frozen_string_literal: true

cask 'say' do
  version '0.7.1'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '9b1be52c63ba419ac4cd350405fcc2313e77b312f04bd27c21bdf009bffcd114'
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
