module RestingDemon

using Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = RestingDemon))

  include(joinpath("..", "genie.jl"))

  Base.eval(Main, :(const Genie = RestingDemon.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
