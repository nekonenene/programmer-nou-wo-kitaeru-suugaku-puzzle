# 平方根を小数で表したときに、0～9までの数字が最も早くすべて現れる最小の整数を求めてください。ただし、ここでは正の平方根のみを対象とします。
# 整数部分を含む場合と、小数部分のみの場合のそれぞれについて求めてください。

require "bigdecimal"
require "bigdecimal/math"

class Q12
  PREC = 30 # 平方根を求める際の有効桁数

  def main
    ans1 = resolve(include_integer_part: true)
    ans2 = resolve(include_integer_part: false)
    puts ans1, ans2

    puts BigMath::sqrt(BigDecimal.new(ans1.to_s), PREC)
    puts BigMath::sqrt(BigDecimal.new(ans2.to_s), PREC)
  end

  def resolve(include_integer_part: true)
    min_prec = 10 # 10桁で0〜9が揃うと最高
    max_prec = 20
    max_num = 100_000 # この値まで見て適合がなければあきらめて次へ

    min_prec.upto(max_prec) do |prec|
      2.upto(max_num) do |num|
        return num if adapt?(num, prec, include_integer_part)
      end
    end
  end

  def adapt?(num, prec, include_integer_part = true)
    # WARN: 0.1234555e2 のような形式で出力されると決めつけている
    str = BigMath::sqrt(BigDecimal.new(num.to_s), PREC).to_s

    if include_integer_part
      include_all_num?(str[2, prec])
    else
      ignore_integers = str.gsub(/^.*e(.+)$/, '\1').to_i
      include_all_num?(str[2 + ignore_integers, prec])
    end
  end

  def include_all_num?(str)
    str.split("").uniq.size == 10
  end
end

Q12.new.main
