# 男性20人、女性10人が到着した場合、どこで区切っても2つのグループのいずれも男女の数が異なってしまうような到着順が何通りあるかを求めてください。

class Q09
  MALE_MAX = 20
  FEMALE_MAX = 10

  # 86s
  def add_person(male_count = 0, female_count = 0, arr = [])
    if male_count == MALE_MAX && female_count == FEMALE_MAX
      reversed_arr = arr.reverse
      return 1 if validate(reversed_arr)
    end
    return 0 if male_count == female_count && male_count > 0
    return 0 if male_count > MALE_MAX || female_count > FEMALE_MAX

    counter = 0
    %w(M F).each do |sex|
      counter +=
        if sex == "M"
          add_person(male_count + 1, female_count, arr.clone.push(sex))
        else
          add_person(male_count, female_count + 1, arr.clone.push(sex))
        end
    end

    counter
  end

  # ちょっとだけ改善 : 86s
  def add_person2(male_count = 0, female_count = 0, arr = [])
    return 1 if male_count == MALE_MAX && female_count == FEMALE_MAX
    return 0 if male_count == female_count && male_count > 0
    return 0 if MALE_MAX - male_count == FEMALE_MAX - female_count
    return 0 if male_count > MALE_MAX || female_count > FEMALE_MAX

    counter = 0
    %w(M F).each do |sex|
      counter +=
        if sex == "M"
          add_person(male_count + 1, female_count, arr.clone.push(sex))
        else
          add_person(male_count, female_count + 1, arr.clone.push(sex))
        end
    end

    counter
  end

  def validate(arr)
    male = 0
    female = 0

    arr.each do |sex|
      if sex == "M"
        male += 1
      else
        female += 1
      end
      return true if male + female == arr.length
      return false if male == female
    end
  end

  def people_pattern(people = [0, 0], history = [], ans_arr = [])
    ans_arr.push(history) if people[0] == MALE_MAX && people[1] == FEMALE_MAX

    %w(M F).each do |sex|
      added = people.clone

      if sex == "M"
        added[0] += 1
      else
        added[1] += 1
      end
      return if added.sum > MALE_MAX + FEMALE_MAX
      people_pattern(added, history.clone.push(sex), ans_arr)
    end

    ans_arr
  end

  # 書籍の解答 0.000104s
  # あるマスへの移動パターン数は、そのマスの下と左の移動パターン数の合計であることを利用している
  # ２次元配列を１次元配列に見立ててるのでわかりにくい
  def beautiful_answer
    boy, girl = MALE_MAX, FEMALE_MAX
    boy, girl = boy + 1, girl + 1
    ary = Array.new(boy * girl){0}
    ary[0] = 1

    girl.times{ |g|
      boy.times{ |b|
        if (b != g) && (boy - b != girl - g)
          ary[b + boy * g] += ary[b - 1 + boy * g] if b > 0
          ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
        end
      }
    }

    puts ary[-2] + ary[-boy - 1]
  end

  # ２次元配列で書いてみた 0.000084s
  def beautiful_answer_double
    boy, girl = MALE_MAX, FEMALE_MAX
    arr = Array.new(boy + 1)
    arr = arr.map{ |arr| Array.new(girl + 1, 0) }
    arr[0][0] = 1

    (girl + 1).times{ |g|
      (boy + 1).times{ |b|
        if (b != g) && (boy - b != girl - g)
          arr[b][g] += arr[b - 1][g] if b > 0
          arr[b][g] += arr[b][g - 1] if g > 0
        end
      }
    }

    arr[boy][girl] = arr[boy - 1][girl] + arr[boy][girl - 1]
  end

  def main
    start_time = Time.now
    p beautiful_answer_double
    end_time = Time.now
    puts end_time - start_time
  end
end

Q09.new.main
