# 10進数、2進数、8進数のいずれで表現しても回文数となる数のうち、10進数の10以上で最小の値を求めてください。
class Q01
  # n進数は n-ary って言うっぽい？
  def validate(num, ary)
    str = num.to_s(ary)
    str == str.reverse
  end

  def main
    (10..10000).each do |i|
      if validate(i, 2) && validate(i, 8) && validate(i, 10)
        puts "2: #{i.to_s(2)} / 8: #{i.to_s(8)} / 10: #{i.to_s(10)}"
      end
    end
  end
end

Q01.new.main
