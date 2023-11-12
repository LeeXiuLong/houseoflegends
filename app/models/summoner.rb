class Summoner < ApplicationRecord

    validates :summoner_name, presence: true

    has_many :summoner_matches

end