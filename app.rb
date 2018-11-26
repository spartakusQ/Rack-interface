class App

  def call(env)
    perfom_request
    [status, headers, body]
  end

  private

  def perfom_request
    sleep rand(2..3)
  end

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["Welcome aboard!\n"]
  end

end
