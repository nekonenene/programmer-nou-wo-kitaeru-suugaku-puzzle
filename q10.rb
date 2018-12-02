# 2≦n≦36のそれぞれのnについて、連続するn個の数の和が最大になる場合を求め、
# ヨーロピアンスタイルでの和がアメリカンスタイルでの和よりも小さくなるnがいくつあるかを求めてください。

class Q10
  AMERICAN = [0,28,9,26,30,11,7,20,32,17,5,22,34,15,3,24,36,13,1,0,27,10,25,29,12,8,19,31,18,6,21,33,16,4,23,35,14,2] # 38区分
  EUROPEAN = [0,32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,1,20,14,31,9,22,18,29,7,28,12,35,3,26] # 37区分

  def main
    start_time = Time.now

    answer = 0
    (2..36).each do |choices|
      answer += 1 if search_max2(EUROPEAN, choices) < search_max2(AMERICAN, choices)
    end

    puts answer

    end_time = Time.now
    puts end_time - start_time
  end

  # 0.0038s
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

  # 左端を減らし右端を増やす、という処理にすることで処理速度改善を狙える
  # 0.00031s : 従来のやり方の約10分の1
  def search_max2(roulette_arr, choices)
    # self[start, length] : start 番目から length 個の要素を含む部分配列を返します
    amount = roulette_arr[0, choices].sum
    max = amount

    roulette_arr.size.times do |i|
      amount -= roulette_arr[i]
      amount += roulette_arr[(i + choices) % roulette_arr.size]

      max = amount if amount > max
    end

    max
  end
end

Q10.new.main
