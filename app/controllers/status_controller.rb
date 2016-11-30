class StatusController < ApplicationController
  skip_before_action :authenticate

  def index
    database_ok = database_ok?

    status = database_ok == :ok ? :ok : :service_unavailable

    render status: status, json: {
      hostname: Sys::Uname.nodename,
      database: database_ok
    }.to_json
  end

  private

  def database_ok?
    ActiveRecord::Base.connected? == true ? :ok : :down
  rescue StandardError => error
    Rails.logger.error(error)
    :down
  end
end
