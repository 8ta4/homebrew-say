# frozen_string_literal: true

source 'https://rubygems.org'

# gem "rails"

# When running RuboCop, an error occurs indicating that the sorbet-runtime file cannot be loaded.
# The error is caused by the .rubocop.yml file located at /opt/homebrew/Library/.
# https://github.com/rubocop/rubocop/issues/11011
# Attempts to resolve the issue by modifying .solargraph.yml to force RuboCop to run
# with the default configuration (rubocop --force-default-config) were unsuccessful.
gem 'sorbet-runtime', '~> 0.5.11104'
