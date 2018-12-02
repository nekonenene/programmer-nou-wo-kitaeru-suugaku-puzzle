# 同じ文字には同じ数字が入り、違う文字には違う数字が入ります。また、最上位の文字に0は入りません。
# 以下の式を満たすような数字の当てはめ方は何通りあるか求めてください。
# READ＋WRITE＋TALK＝SKILL

#   READ
#  WRITE
# + TALK
# ------
#  SKILL

#  4905
# 24689
#  8017
# 37611

# Memo
# S - W = 1 , 1 <= W <= 8, 2 <= S <= 9
# A + T = 10
# E + A = 9
# D + E + K < 10
# 2R + T + 1 >= 10
# R, W, T, S are not 0
# A D E I K L R S T W の 10 文字

class Q13
  def main
    all_num = (0..9).to_a

    (1..8).each do |w|
      s = w + 1
      (0..9).each do |a|
        t = 10 - a
        e = 9 - a

        used_num = [s, w, a, t, e]
        next if used_num.uniq.count != 5

        (1..9).each do |r|
          next if used_num.include?(r)
          next if 2 * r + t + 1 < 10

          remain_num = all_num - used_num.clone.push(r)
          remain_num.each do |d|
            remain_num.each do |k|
              next if d == k
              next if d + e + k >= 10
              remain_num2 = remain_num.select{ |num| num != d && num != k }

              remain_num2.each do |l|
                remain_num2.each do |i|
                  next if i == l

                  read = "#{r}#{e}#{a}#{d}".to_i
                  write = "#{w}#{r}#{i}#{t}#{e}".to_i
                  talk = "#{t}#{a}#{l}#{k}".to_i
                  skill = "#{s}#{k}#{i}#{l}#{l}".to_i

                  if read + write + talk == skill
                    p [read, write, talk, skill]
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Q13.new.main
