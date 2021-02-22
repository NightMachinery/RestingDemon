using Genie, Genie.Router, Genie.Requests, Genie.Renderer.Json
using DaemonMode

# serve()

route("/") do
  serve_static_file("welcome.html")
end

route("/jsonpayload", method = POST) do
  @show jsonpayload()
  out = runexpr(jsonpayload()["code"])
  json(out)
end
