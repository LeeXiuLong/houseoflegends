class Champion < ApplicationRecord

    validates :champion_name, presence: true
    validates :api_champion_id, presence: true

    has_many :summoner_matches
end