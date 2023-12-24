# frozen_string_literal: true

cask 'say' do
  version '0.3.0'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 'd8482d84d412337d82a741f7dda8c353e4db6ce407b872badce824147c8561e0'
  depends_on formula: 'ffmpeg'
  depends_on cask: 'visual-studio-code'
  app 'say.app'
end
