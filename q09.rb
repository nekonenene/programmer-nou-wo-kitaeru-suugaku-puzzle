# 男性20人、女性10人が到着した場合、どこで区切っても2つのグループのいずれも男女の数が異なってしまうような到着順が何通りあるかを求めてください。

class Q09
  MALE_MAX = 20
  FEMALE_MAX = 10

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

  def main
    answer = add_person
    p answer
  end
end

Q09.new.main
