class App
  require 'rack'
  require_relative 'time_format'

  def call(env)
    request   = Rack::Request.new(env)
    @response = Rack::Response.new([], 200, { 'Content-Type' => 'text/plain' })

    if request.path_info == '/time'
      not_found_response(request.params)
    else
      @response.write "Unknown time format #{request.path_info}"
      @response.status = 404
    end
    @response.finish
  end

  def not_found_response(params)
    formatter = TimeFormat.new(params)
    if formatter.result
      @response.write formatter.result
      @response.status = 200
    else
      @response.write "Unknown time format #{formatter.errors}"
      @response.status = 400
    end
  end

end
