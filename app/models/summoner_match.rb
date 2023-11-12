class SummonerMatch < ApplicationRecord

    validates :match_id, presence: true
    validates :summoner_id, presence: true
    validates :champion_id, presence: true
    
    belongs_to :summoner
    belongs_to :champion
end