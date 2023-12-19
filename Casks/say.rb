# frozen_string_literal: true

cask 'say' do
  version '0.2.1'
  url "https://github.com/8ta4/say/releases/download/v#{version}/say.dmg"
  sha256 '25d37502c45998c2d6f6b278df6a4c6eeb82c7cfa0d918336b12111432bbcccb'
  depends_on formula: 'ffmpeg'
  depends_on cask: 'visual-studio-code'
  app 'say.app'
end
