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
# S - W = 1 or 2, 1 <= W <= 8, 2 <= S <= 9
# A + T = 8 or 10
# E + A = 9
# D + E + K < 10 or D + E + K >= 20
# R, W, T, S are not 0
# A D E I K L R S T W の 10 文字

class Q13
  def main
    all_num = (0..9).to_a
    ans_arr = []

    all_num.permutation(6).each do |s, w, a, t, e, r|
      next if s == 0 || w == 0 || t == 0 || r == 0
      next if e + a != 9
      next if a + t != 8 && a + t != 10
      next if s - w != 1 && s - w != 2

      (all_num - [s, w, a, t, e, r]).permutation.each do |d, k, i, l|
        next if (a + t == 8) && (d + e + k < 20)
        next if (a + t == 10) && (d + e + k >= 10)

        read = "#{r}#{e}#{a}#{d}".to_i
        write = "#{w}#{r}#{i}#{t}#{e}".to_i
        talk = "#{t}#{a}#{l}#{k}".to_i
        skill = "#{s}#{k}#{i}#{l}#{l}".to_i

        if read + write + talk == skill
          ans_arr.push([read, write, talk, skill])
        end
      end
    end

    pp ans_arr
    p ans_arr.count
  end
end

Q13.new.main
