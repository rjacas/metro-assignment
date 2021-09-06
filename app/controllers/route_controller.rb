class RouteController < ApplicationController
  #POST /route/best_route
  def best_route
    run_or_print_and_render_error {
      metro_line_file = params[:line_file]
      init_station = params[:init]
      end_station = params[:end]
      color = params[:color]
      p params
      p metro_line_file
      p init_station
      p end_station
      p color
      render json: {recieved: true}, status: :ok
    }
  end

  def run_or_print_and_render_error(&block)
    begin
      block.call
    rescue => e
      p e
      p e.backtrace
      Rails.logger.error e
      Rails.logger.error e.backtrace
      render json: {error: e}, status: :internal_server_error
    end
  end
end
