# 国名でしりとりをします。
# どの国名も一度しか使うことができないとき、最も長く続けられる順を求め、使用した国名の数を答えてください。

class Q14
  COUNTRIES = [
    "Spain",
    "Germany",
    "Brazil",
    "Portugal",
    "Argentina",
    "Switzerland",
    "Uruguay",
    "Colombia",
    "Italy",
    "England",
    "Belgium",
    "Greece",
    "USA",
    "Chile",
    "Holland",
    "France",
    "Croatia",
    "Russia",
    "Mexico",
    "Bosnia and Herzegovina",
    "Algeria",
    "Ivory Coast",
    "Ecuador",
    "Costa Rica",
    "Honduras",
    "Ghana",
    "Iran",
    "Nigeria",
    "Japan",
    "Cameroon",
    "South Korea",
    "Australia",
  ]

  def main
    puts COUNTRIES.count
  end
end

Q14.new.main
