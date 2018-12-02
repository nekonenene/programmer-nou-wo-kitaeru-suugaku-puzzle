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
    return if move_history.count > MOVE_MAX
    return if move_history.include?(pos)
    move_history_new = move_history.clone.push(pos.clone)

    return ans_arr.push(dir_history) if move_history.count == MOVE_MAX

    %w(u d l r).each do |dir|
      case dir
      when "u"
        new_pos = { x: pos[:x], y: pos[:y] - 1 }
      when "d"
        new_pos = { x: pos[:x], y: pos[:y] + 1 }
      when "l"
        new_pos = { x: pos[:x] - 1, y: pos[:y] }
      when "r"
        new_pos = { x: pos[:x] + 1, y: pos[:y] }
      end
      move(new_pos, move_history_new, dir_history.clone.push(dir), ans_arr)
    end

    ans_arr
  end
end

Q08.new.main
