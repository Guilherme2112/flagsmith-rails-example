class FlagsController < ApplicationController
  def index
    render json: { status: $flagsmith.get_environment_flags.is_feature_enabled(ENV.fetch('FLAG_NAME')) }
  end
end
