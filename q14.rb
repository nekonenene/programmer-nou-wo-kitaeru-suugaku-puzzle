# 国名でしりとりをします。
# どの国名も一度しか使うことができないとき、最も長く続けられる順を求め、使用した国名の数を答えてください。

class Q14
  COUNTRIES = [
    "Brazil",
    "Cameroon",
    "Chile",
    "Greece",
    "Uruguay",
    "Italy",
    "France",
    "Bosnia and Herzegovina",
    "Germany",
    "USA",
    "Russia",
    "Croatia",
    "Spain",
    "Australia",
    # "Ivory Coast",
    "Côte d'Ivoire",
    "Costa Rica",
    "Switzerland",
    "Honduras",
    "Iran",
    "Portugal",
    "Belgium",
    # "South Korea",
    "Korea Republic",
    "Mexico",
    # "Holland",
    "Netherlands",
    "Colombia",
    "Japan",
    "England",
    "Ecuador",
    "Argentina",
    "Nigeria",
    "Ghana",
    "Algeria",
  ]

  def main
    # p last_first_pairs_count
    patterns = shiritori
    max = 0
    max_example = []

    patterns.each do |pattern|
      if pattern.count > max
        max = pattern.count
        max_example = []
      end

      max_example.push(pattern) if pattern.count == max
    end

    p max
    pp max_example
  end

  # すべてのしりとりの結果を返す
  def shiritori(first_char = nil, history = [], ans_arr = [])
    flag = false
    COUNTRIES.each do |country|
      next if history.include?(country)
      next if !first_char.nil? && first_char.upcase != country[0].upcase
      flag = true
      shiritori(country[-1], history.clone.push(country), ans_arr)
    end

    ans_arr.push(history) if !flag
    ans_arr
  end

  # 最長の目安を求めるのに使用した
  def last_first_pairs_count
    last_chars = []
    COUNTRIES.each do |country|
      last_chars.push(country[-1].upcase)
    end

    counter = 0
    last_chars.uniq.each do |char|
      first_count = COUNTRIES.select{ |country| country[0].upcase == char }.count
      last_count = COUNTRIES.select{ |country| country[-1].upcase == char }.count
      common = [first_count, last_count].min
      # p [char, common]
      counter += common
    end

    counter
  end
end

Q14.new.main
