# frozen_string_literal: true

enable_offline_mode = ENV.fetch('FLAGSMITH_OFFLINE_MODE').to_s == 'true'
enable_local_evaluation = ENV.fetch('FLAGSMITH_LOCAL_EVALUATION').to_s == 'true'

offline_handler = if enable_offline_mode
  Flagsmith::OfflineHandlers::LocalFileHandler.new("config/toggles/#{Rails.env}.json")
end

$flagsmith = Flagsmith::Client.new(
  # Your API Token.
  # Note that this is either the `Environment API` key or the `Server Side SDK Token`
  # depending on if you are using Local or Remote Evaluation
  # Required.
  environment_key: ENV.fetch('FLAGSMITH_API_KEY'),

  # Controls which mode to run in; local or remote evaluation.
  # See the `SDKs Overview Page` for more info
  # Optional.
  # Defaults to false.
  # Requires a valid server-side api key otherwise application wont boot
  enable_local_evaluation: enable_local_evaluation,

  # When running in local evaluation mode, defines
  # how often to request an updated Environment document in seconds
  # Optional
  # Defaults to 60 seconds
  environment_refresh_interval_seconds: 30,

  # The network timeout in seconds.
  # Optional.
  # Defaults to 10 seconds
  request_timeout_seconds: 10,

  # A faraday retry object to control network retry policy
  # See https://www.rubydoc.info/gems/faraday/0.15.3/Faraday/Request/Retry
  # Optional
  # Defaults to nil
  retries: nil,

  # Controls whether Flag Analytics data is sent to the Flagsmith API
  # See https://docs.flagsmith.com/advanced-use/flag-analytics
  # Optional
  # Defaults to False
  enable_analytics: false,

  # Configures the ofline mode setting
  # When in offline mode, the feature toggles are handled by the offline handler, instead of performing the HTTP request
  offline_mode: enable_offline_mode,
  offline_handler: offline_handler
)
