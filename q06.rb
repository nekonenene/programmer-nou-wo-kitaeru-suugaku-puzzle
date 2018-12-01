# ・nが偶数の場合、nを2で割る
# ・nが奇数の場合、nに3をかけて1を足す
# 初期値が偶数の場合、初回のみnに3をかけて1を足すことから始めることとし、「最初の数」に戻るものを考えます。

class Q06
  MAX = 10_000
  MAX_CHECK_LOOP = 10_000

  def even_nums(max)
    (1..(max / 2)).map{ |i| i * 2 }
  end

  def main
    nums = even_nums(MAX)

    answer = []
    nums.each do |num|
      answer.push(num) if adapt?(num)
    end

    p answer
    puts answer.count
  end

  def adapt?(origin_num)
    num = origin_num
    num = num * 3 + 1 if num % 2 == 0

    MAX_CHECK_LOOP.times do
      if num % 2 == 0
        num /= 2
      else
        num = num * 3 + 1
      end

      # 1 -> 4 -> 2 -> 1 のループに入り込むので、1 なら終了
      if num == 1
        return false
      elsif num == origin_num
        return true
      end
    end

    false
  end
end

Q06.new.main
