# frozen_string_literal: true

cask 'say' do
  version '0.2.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'b8828df280303279822aed49b7b572f21f31550c061ad21a4823dcee50b9be90'
  depends_on formula: 'ffmpeg'
  depends_on cask: 'visual-studio-code'
  app 'say.app'
end
