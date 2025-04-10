class BarApp
  def call env
    request_body = env['rack.input'].read
    JSON.parse(request_body)
    status = 200
    headers = {'Content-Type' => 'application/json'}
    body = {
      "user": {
        "name": "John Doe",
      },
    }.to_json
    [status, headers, [body]]
  rescue JSON::ParserError => e
    status = 400
    headers = {'Content-Type' => 'application/json; charset=utf-8'}
    body = {
      "error": {
        "code": 400,
        "message": "Bad Request",
        "details": e.message,
        "request": {
          "method": env['REQUEST_METHOD'],
          "path": env['PATH_INFO'],
          "query": env['QUERY_STRING'],
          "headers": env.select { |k, _| k.start_with?('HTTP_') },
          "body": request_body,
        },
      },
    }.to_json
    [status, headers, [body]]
  end
end
