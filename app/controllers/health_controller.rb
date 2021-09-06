class HealthController < ApplicationController
  def show
    render json: { current: DateTime.now, status: 'OK' }
  end
end
