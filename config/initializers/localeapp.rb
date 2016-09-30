# frozen_string_literal: true

if Rails.env.development?
  require_relative '../application'
  require 'localeapp/rails'

  Localeapp.configure do |config|
    config.api_key = ENV['LOCALEAPP_APIKEY']

    config.polling_environments = []
    config.sending_environments = []
    config.reloading_environments = []
    config.cache_missing_translations = true
  end
end
