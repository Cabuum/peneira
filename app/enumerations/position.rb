class Position < EnumerateIt::Base
  associate_values :goalkeeper, :centre_back, :sweeper, :full_back, :wing_back, :centre_midfield, :defensive_midfield, :attacking_midfield, :wide_midfield, :centre_forward, :second_striker, :winger
end
