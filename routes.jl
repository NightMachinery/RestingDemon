using Genie, Genie.Router, Genie.Requests, Genie.Renderer.Json
using DaemonMode

# serve()

route("/") do
  serve_static_file("welcome.html")
end

route("/jsonpayload", method = POST) do
  @show jsonpayload()
  code = jsonpayload()["code"]
  # out = runexpr(code)
  out = eval(Meta.parse(code))
  json(out)
end
