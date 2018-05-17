require "kemal"

alias AllParamTypes = Nil | String | Int64 | Float64 | Bool | Hash(String, JSON::Type) | Array(JSON::Type)

before_all "/**" do |env|
  env.response.content_type = "application/json"
end

get "/" do |env|
  parse_request(env)
end

get "/**" do |env|
  parse_request(env)
end

post "/" do |env|
  parse_request(env)
end

post "/**" do |env|
  parse_request(env)
end

def parse_request(env)
  parse_headers(env)
  if env.request.headers["Content-Type"]?.try(&.starts_with?("application/json"))
    parse_json_body(env)
  else
    parse_form_body(env)
  end
end

def parse_form_body(env)
  hash = Hash(String, String).new

  env.params.body.map do |key, value|
    hash[key] = value
  end

  hash.to_json
end

def parse_json_body(env)
  hash = Hash(String, AllParamTypes).new

  env.params.json.map do |key, value|
    hash[key] = value
  end

  hash.to_json
end

def parse_headers(env)
  env.request.headers.each do |k, v|
    next if k.downcase == "content-type"
    env.response.headers[k] = v
  end
end

Kemal.run
