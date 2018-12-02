# 年月日をYYYYMMDDの8桁の整数で表したとき、これを2進数に変換して逆から並べ、さらに10進数に戻したとき、元の日付と同じ日付になるものを探してください。
# 期間は、前回の東京オリンピック（1964年10月10日）から、次回の東京オリンピック（2020年7月24日予定）とします。

require 'date'

class Q07
  START_DATE = "1964-10-10"
  END_DATE = "2020-07-24"

  def parotum_number?(num, ary)
    str = num.to_s(ary)
    str == str.reverse
  end

  def main
    date = Date.parse(START_DATE)
    answer = []
    while date <= Date.parse(END_DATE) do
      num = date.strftime("%Y%m%d").to_i
      answer << num if parotum_number?(num, 2)
      date = date.next_day
    end

    p answer
  end
end

Q07.new.main
