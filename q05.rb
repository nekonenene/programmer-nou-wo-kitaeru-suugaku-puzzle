# たくさんの小銭が出ると困るため、最大で15枚になるように両替します。例えば、1000円を両替するときに、「10円玉を100枚」という両替はできません。
# 1000円札を入れたときに出てくる硬貨の組み合わせは何通りあるかを求めてください。なお、硬貨の順番は区別しないものとします。
# 10, 50, 100, 500

class Q05
  COIN_MAX = 15
  TARGET_AMOUNT = 1000

  def collect_coin(coin_arr = [], ans_arr = [])
    return if coin_arr.sum > TARGET_AMOUNT || coin_arr.count > COIN_MAX
    return ans_arr.push(coin_arr) if coin_arr.sum == TARGET_AMOUNT

    [10, 50, 100, 500].each do |coin|
      # 計算時間削減のため、重複の組み合わせを避ける
      next if !coin_arr.empty? && coin < coin_arr.last
      # push すると coin_arr 自体に変更を与えてしまうので clone してるのがポイント
      collect_coin(coin_arr.clone.push(coin), ans_arr)
    end
    ans_arr
  end
end

answer = Q05.new.collect_coin
pp answer
puts answer.size
