# フィボナッチ数列のうち、各桁の数字を足した数で割り切れる数を、以下の例に続けて小さい方から5個求めてください。

class Q11
  LOOP_MAX = 200

  # 各桁の和で自身を割り切れるか
  def sum_divide?(num)
    num_str = num.to_s
    sum = 0
    num_str.size.times{ |i| sum += num_str[i].to_i }
    num % sum == 0
  end

  def main
    fibbo = [1, 1]
    ans = []

    LOOP_MAX.times do |i|
      new_num = fibbo[i] + fibbo[i + 1]
      ans.push(new_num) if sum_divide?(new_num)
      fibbo.push(new_num)
    end
    p ans
  end
end

Q11.new.main
