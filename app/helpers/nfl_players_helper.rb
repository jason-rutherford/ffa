module NflPlayersHelper

  def ui_label_color(position)
    case position
      when "QB" then "violet"
      when "WR" then "blue"
      when "RB" then "green"
      when "TE" then "teal"
      when "DEF" then "red"
      when "K" then "yellow"
    else "orange"
    end
  end
end
