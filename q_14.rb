@countries = ["Brazil", "Croatia", "Mexico", "Cameroon",
            "Spain", "Netherlands", "Chile", "Australia",
            "Colombia", "Greece", "Cote d'Ivoire", "Japan",
            "Uruguay", "Costa Rica", "England", "Italy",
            "Switzerland", "Ecuador", "France", "Honduras",
            "Argentina", "Bosnia and Herzegovina", "Iran",
            "Nigeria", "Germany", "Portugal", "Ghana",
            "USA", "Belgium", "Algeria", "Russia",
            "Korea Republic"]

def chain_game(last_word, countries, depth)
  match_countries = countries.select{|country| country.upcase[0] == last_word.upcase[-1]}
  if match_countries.size > 0
    match_countries.each{|country|
      chain_game(country, countries - [country], depth + 1)
    }
  else
    @max_depth = [@max_depth, depth].max
  end
end

@max_depth = 0
@countries.each{|country|
  chain_game(country, @countries - [country], 1)
}
puts @max_depth
