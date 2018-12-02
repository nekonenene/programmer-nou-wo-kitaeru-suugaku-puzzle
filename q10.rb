# 2≦n≦36のそれぞれのnについて、連続するn個の数の和が最大になる場合を求め、
# ヨーロピアンスタイルでの和がアメリカンスタイルでの和よりも小さくなるnがいくつあるかを求めてください。

class Q10
  AMERICAN = [0,28,9,26,30,11,7,20,32,17,5,22,34,15,3,24,36,13,1,0,27,10,25,29,12,8,19,31,18,6,21,33,16,4,23,35,14,2] # 38区分
  EUROPEAN = [0,32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,1,20,14,31,9,22,18,29,7,28,12,35,3,26] # 37区分

  def main
    answer = 0
    (2..36).each do |choices|
      answer += 1 if search_max(EUROPEAN, choices) < search_max(AMERICAN, choices)
    end

    puts answer
  end

  def search_max(roulette_arr, choices, start = 0, max = 0)
    return max if start - 1 == roulette_arr.size - 1

    amount = 0
    choices.times do |i|
      index = (start + i) % roulette_arr.size
      amount += roulette_arr[index]
    end
    max = amount if amount > max
    search_max(roulette_arr, choices, start + 1, max)
  end
end

Q10.new.main
