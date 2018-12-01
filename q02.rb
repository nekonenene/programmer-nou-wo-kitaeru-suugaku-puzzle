# 並んでいる数字の各桁の間に四則演算の演算子を入れて計算することにします（演算子を入れない場所があっても構いませんが、最低でも1つは入れるものとします）。
# できあがった式を計算した結果、「元の数の桁を逆から並べた数字」と同じになるものを考えます。

class Q02
  OPS = ["+", "-", "*", "/", ""]
  # OPS = ["*", ""] # 実はかけ算以外を使うと、必ず元の桁数より小さくなってしまうから、この2つでいいのだ

  def main
    (1000..9999).each do |num|
      result = search(num)
      puts num if result.length > 0
    end
  end

  def search(num)
    num_str = num.to_s
    num_length = num_str.length

    formulas = create_formulas(num_str, num_length)

    adapts = []
    formulas.each do |formula|
      next if formula.length == num_length

      begin
        cleaned_formula = clean_formula(formula)
        if num_str.reverse == eval(cleaned_formula).to_s
          puts "#{cleaned_formula} = #{eval(cleaned_formula)}"
          adapts.push(cleaned_formula)
        end
      rescue ZeroDivisionError
      end
    end

    adapts
  end

  # 0 始まりが 8 進数と認識されてしまうので、0始まりにならないようにする
  def clean_formula(formula)
    str = formula.gsub(/^0+([1-9])/, '\1')
    str.gsub(/([^0-9])0+([1-9])/, '\1\2')
  end

  # 文字列の各所に OP を挟み込んだ、考えうる文字列を配列として返す
  # 例： 111 -> ["1+11", "1-11", "1+1+1", "11-1" ,,,etc,,, ]
  def create_formulas(num_str, num_length, counter = 0, result_str = "", arr = [])
    result_str += num_str[counter]
    return arr.push(result_str) if (num_length - 1) == counter
    OPS.each do |op|
      create_formulas(num_str, num_length, counter + 1, result_str + op, arr)
    end
    arr
  end
end

# puts Q02.new.clean_formula("0020+008+01")
Q02.new.main
