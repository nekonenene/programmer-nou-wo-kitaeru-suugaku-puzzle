# 100枚のカードが順番に並べられています。（最初はすべて裏向き）
# n番目のカードからn－1枚おきにカードを裏返す操作を、どのカードの向きも変わらなくなるまで続けたとします。
# カードの向きが変わらなくなったとき、裏向きになっているカードの番号をすべて求めてください。

class Q3
  CARDS_COUNT = 100

  def main
    statuses = set_cards
    new_statuses = statuses.clone

    (2..CARDS_COUNT).each do |i|
      multi = 1
      while i * multi <= CARDS_COUNT do
        index = i * multi - 1
        new_statuses[index] = ! new_statuses[index]
        multi += 1
      end

      if new_statuses == statuses
        puts i
        break
      end
      statuses = new_statuses.clone
    end

    answer = []
    new_statuses.each_with_index do |status, i|
      answer.push(i + 1) if !status
    end

    p answer
  end

  def set_cards
    card_statuses = []
    CARDS_COUNT.times do |i|
      card_statuses[i] = false
    end
    card_statuses
  end
end

Q3.new.main
