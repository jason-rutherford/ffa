class NflTeam < ApplicationRecord


  def bye_week
    NflBye.where(team: self.code).select(:bye_week).map(&:bye_week).first
  end
  
end
