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

### ideas
# function parse_eval_dict(s::AbstractString, locals::Dict{Symbol})
#     ex = Meta.parse(s)
#     assignments = [:($sym = $val) for (sym,val) in locals]
#     eval(:(let $(assignments...); $ex; end))
# end
###
