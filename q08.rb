# 同じ場所を通らない掃除ロボットを考えます。このロボットは、前後左右にのみ移動することができます。
# このロボットが12回移動するとき、考えられる移動経路のパターンが何通りあるかを求めてください。

class Q08
  MOVE_MAX = 12

  def main
    pos = { x: 0, y: 0 }

    answer = move(pos)
    # p answer
    puts answer.count
  end

  def move(pos, move_history = [], dir_history = [], ans_arr = [])
    return if move_history.include?(pos)
    move_history_new = move_history.clone.push(pos.clone)

    # 最初の位置プラス移動箇所になることに注意
    return if move_history_new.count > MOVE_MAX + 1
    return ans_arr.push(dir_history) if move_history_new.count == MOVE_MAX + 1

    %w(u d l r).each do |dir|
      new_pos = pos.clone
      case dir
      when "u"
        new_pos[:y] -= 1
      when "d"
        new_pos[:y] += 1
      when "l"
        new_pos[:x] -= 1
      when "r"
        new_pos[:x] += 1
      end
      move(new_pos, move_history_new, dir_history.clone.push(dir), ans_arr)
    end

    ans_arr
  end
end

Q08.new.main
