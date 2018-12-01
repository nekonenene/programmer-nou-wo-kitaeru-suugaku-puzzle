# 長さn［cm］の1本の棒を1［cm］単位に切り分けることを考えます。
# ただし、1本の棒を一度に切ることができるのは1人だけです。切り分けられた棒が3本あれば、同時に3人で切ることができます。
# 最大m人の人がいるとき、最短何回で切り分けられるかを求めてください。

class Q04
  def cut_wood(length, people_count, woods_count = 1, cut_count = 0)
    if woods_count >= length
      return cut_count
    end

    if woods_count < people_count
      # 切れる木だけカット
      cut_wood(length, people_count, woods_count * 2, cut_count + 1)
    else
      # 人数分、木をカットして本数が増える
      cut_wood(length, people_count, woods_count + people_count, cut_count + 1)
    end
  end
end

puts Q04.new.cut_wood(8, 3)
puts Q04.new.cut_wood(20, 3)
puts Q04.new.cut_wood(100, 5)
