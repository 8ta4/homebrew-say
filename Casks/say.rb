# frozen_string_literal: true

cask 'say' do
  version '0.4.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'acda9c3091b524da5404956d389ad9489d95787daa98630331e0028763b092e5'
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
