@countries = ["Brazil", "Croatia", "Mexico", "Cameroon",
            "Spain", "Netherlands", "Chile", "Australia",
            "Colombia", "Greece", "Cote d'Ivoire", "Japan",
            "Uruguay", "Costa Rica", "England", "Italy",
            "Switzerland", "Ecuador", "France", "Honduras",
            "Argentina", "Bosnia and Herzegovina", "Iran",
            "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia",
            "Korea Republic"]

def chain_game(last_word, countries, depth, chains)
  match_countries = countries.select{|country| country.upcase[0] == last_word.upcase[-1]}
  if match_countries.size > 0
    match_countries.each{|country|
      this_chains = chains.clone
      this_chains.push(country)
      chain_game(country, countries - [country], depth + 1, this_chains)
    }
  else
    @max_depth = [@max_depth, depth].max
    @chains.push(chains)
  end
end

@max_depth = 0
@chains = []
@countries.each{|country|
  chain_game(country, @countries - [country], 1, [country])
}
puts @max_depth
@chains.each do |chain|
  if chain.size >= @max_depth
    p chain
  end
end
