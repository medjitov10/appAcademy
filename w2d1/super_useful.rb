# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue
    p "wrong imput"
    nil
  end
end

class MySpecialError < StandardError
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else

        raise MySpecialError.new("this is my error message")

    end
  rescue MySpecialError => my_error
    puts my_error.message
    p "Not a fruit. Retry."
    maybe_fruit = gets.chomp

    retry
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

class YearsKnownError < StandardError
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name

    validate_year!(yrs_known)
    @yrs_known = yrs_known

    @fav_pastime = fav_pastime
  end

  def validate_year!(years)
    # begin
      unless years >=5

        raise YearsKnownError.new('not friends long enough')
      end
    # rescue Error
    #     raise "not long enough"
    # end

  end
  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
