require "./spec_helper"

it "echoes on get" do
  get "/get"

  response.status_code.should eq 200
  response.content_type.should eq "application/json"
end

it "echoes headers" do
  get "/get", headers: HTTP::Headers{"STEP_ID" => "1234"}

  response.status_code.should eq 200
  response.content_type.should eq "application/json"
  response.headers["STEP_ID"].should eq "1234"
end

it "echoes on post with request data" do
  body = "name=Serdar&password=1234"
  post("/post", headers: HTTP::Headers{"Content-Type" => "application/x-www-form-urlencoded"}, body: body)

  response.status_code.should eq 200
  response.content_type.should eq "application/json"
  response.body.should eq({name: "Serdar", password: "1234"}.to_json)
end

it "echoes on post with request data as json" do
  body = {"name": "Serdar", "skills": ["ruby", "crystal, kemal"]}
  post("/post", headers: HTTP::Headers{"Content-Type" => "application/json"}, body: body.to_json)

  response.status_code.should eq 200
  response.content_type.should eq "application/json"
  response.body.should eq body.to_json
end
