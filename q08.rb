# 同じ場所を通らない掃除ロボットを考えます。このロボットは、前後左右にのみ移動することができます。
# このロボットが12回移動するとき、考えられる移動経路のパターンが何通りあるかを求めてください。

class Q08
  MOVE_MAX = 12

  def main
    pos = { x: 0, y: 0 }

    answer = move(pos)
    puts answer.count
  end

  def move(pos, move_history = [], dir_history = [], ans_arr = [])
    return if move_history.count > MOVE_MAX
    return if move_history.include?(pos)
    move_history_new = move_history.clone.push(pos.clone)

    return ans_arr.push(move_history_new) if move_history.count == MOVE_MAX

    %w(u d l r).each do |dir|
      case dir
      when "u"
        move({ x: pos[:x], y: pos[:y] - 1 }, move_history_new, dir_history.clone.push(dir), ans_arr)
      when "d"
        move({ x: pos[:x], y: pos[:y] + 1 }, move_history_new, dir_history.clone.push(dir), ans_arr)
      when "l"
        move({ x: pos[:x] - 1, y: pos[:y] }, move_history_new, dir_history.clone.push(dir), ans_arr)
      when "r"
        move({ x: pos[:x] + 1, y: pos[:y] }, move_history_new, dir_history.clone.push(dir), ans_arr)
      end
    end

    ans_arr
  end
end

Q08.new.main
