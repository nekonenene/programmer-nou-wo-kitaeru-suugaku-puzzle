# Aさんが下にBさんが上にいます。
# 最大で3段まで飛ばして進む（一気に4段進む）ことができます。
# 10段の階段で移動したとき、同じ段に止まるのは何通り？

# Memo:
#  0 -> 4 -> 5
# 10 -> 6 -> 5
# 4, 1, 1, 4
# 1, 2, 1, 2, 2, 2
# 1 ~ 4 を足していって 10 になる。ただし加算回数は偶数
# 1, 2 段目とかで合流することはない
class Q15
  def main
    # 2.191652s
    start_time = Time.now
    puts resolve(4)
    puts resolve(10)
    puts resolve(20)
    puts (Time.now - start_time).to_s + "s"
    puts

    # 0.005227s
    start_time = Time.now
    puts resolve_memo(4)
    puts resolve_memo(10)
    puts resolve_memo(20)
    puts (Time.now - start_time).to_s + "s"
    puts
  end

  def resolve(steps)
    answer = 0

    # 計算量削減のため、対称となる部分は計算せず済むよう、中心以下の階段で出会う場合のみを考えて2倍する
    (1..(steps / 2)).each do |meeting_point|
      next if meeting_point == 0

      (1..meeting_point).each do |move_max|
        a = add(meeting_point, move_max)
        b = add(steps - meeting_point, move_max)

        answer +=
          if meeting_point.to_f == steps.to_f / 2
            a * b
          else
            a * b * 2
          end
      end
    end

    answer
  end

  # 1 〜 4 を指定回数だけ足して求める数値になるのは何通りか算出
  def add(target_num, max_count, sum = 0, count = 0)
    return 1 if count == max_count && sum == target_num
    return 0 if count > max_count

    answer = 0
    (1..4).each do |i|
      answer += add(target_num, max_count, sum + i, count + 1)
    end

    answer
  end

  # メモ化（一度計算したものを保存しておく方法）により高速な処理を可能にしたバージョン
  def resolve_memo(steps)
    @memo = {}

    # a: Aさんの位置、最初は0段目にいて上がっていく
    # b: Bさんの位置、最初は一番上の段にいて降りていく
    def move(a = 0, b)
      return @memo[[a, b]] if @memo.has_key?([a, b])
      return @memo[[a, b]] = 0 if a > b # AさんがBよりも上に来ればおしまい
      return @memo[[a, b]] = 1 if a == b # 同じ段に止まったら +1

      counter = 0
      (1..4).each do |da|
        (1..4).each do |db|
          counter += move(a + da, b - db) # 再帰的に探索
        end
      end

      @memo[[a, b]] = counter
    end

    move(0, steps)
  end
end

Q15.new.main
