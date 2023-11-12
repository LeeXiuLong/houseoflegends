 match_ids = [
    4823729108,
    4826712982,
    4827744215,
    4827676445,
    4826605034,
    4825707550,
    4825644398,
    4825586741,
    4823905286,
    4823841469,
    4823798424,
    4822995775,
    4822927698,
    4822858961,
    4822071614
 ]

port = "52152"
password = "-dOv3B7UFUC1UXdz-KgSLw"

match_ids.each do |match_id|

    match = Match.create(match_id: match_id)

    match_data = LcuApiService.get_match_data(password, port, match_id)

    participant_identities = match_data["participantIdentities"]

    participants_hash = match_data["participants"]

    participant_identities.each_with_index do |participant, index|


        summoner = Summoner.find_by(summoner_name: participant["player"]["gameName"])

        if summoner
            #get the summoners id using their game name
            this_participants_hash = participants_hash[index]
            this_participants_stats = this_participants_hash["stats"]
            this_participants_timeline = this_participants_hash["timeline"]
            this_participants_lane = this_participants_timeline["lane"]
            this_participants_role = this_participants_timeline["role"]

            summoner_id = summoner.id
            api_champion_id = this_participants_hash["championId"]
            champion = Champion.find_by(api_champion_id: api_champion_id)
            win = this_participants_stats["win"]
            role = this_participants_lane != "BOTTOM" ? this_participants_lane : this_participants_role
            #change this to champion.id instead of champion_id
            summoner_match = SummonerMatch.create(
                match_id: match_id,
                summoner_id: summoner_id,
                champion_id: champion.id,
                win: win,
                role: role
            )

            summoner_match.save!
        end
    end
end