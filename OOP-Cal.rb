def main
  choice = select_calculator
  if    choice.downcase == 'b' then Basic_calculator.new.on_run
  elsif choice.downcase == 'a' then Advanced_calculator.new.on_run
  end
end

def select_calculator
  puts 'Which calculator would you like to use the:'
  puts '(B)asic'
  puts '(A)dvanced'
  return calculator_type = gets.chomp
end

class Basic_calculator

  def get_operator
    puts 'Which operation would you like to use:'
    puts '(a)dd'
    puts '(s)ubstract'
    puts '(m)ultiply'
    puts '(d)ivide'
    choice = gets.chomp
    if    choice.downcase == 'a' then return '+'
    elsif choice.downcase == 's' then return '-'
    elsif choice.downcase == 'm' then return 'x'
    elsif choice.downcase == 'd' then return '/'
    else
      puts "That's not right..."
      return '+'
    end
  end

  def is_number? string
    return true if Float(string) rescue false
  end

  def get_numbers
    puts ''
    puts 'Please select your numbers'
    num1 = gets.chomp
    num2 = gets.chomp
    if is_number?(num1) then num1 = num1.to_f
    else
      puts "I don't think #{num1} is a number"
      num1 = 1.0
    end
    if is_number?(num2) then num2 = num2.to_f
    else
      puts "I don't think #{num2} is a number"
      num2 = 1.0
    end
    return [num1, num2]
  end

  def get_answer numbers, operator
    if    operator == '+' then return numbers[0] + numbers[1]
    elsif operator == '-' then return numbers[0] - numbers[1]
    elsif operator == 'x' then return numbers[0] * numbers[1]
    elsif operator == '÷' then return numbers[0] / numbers[1]
    end
  end

  def on_run
    operator = get_operator
    numbers = get_numbers
    puts "#{numbers[0]} #{operator} #{numbers[1]} = #{get_answer(numbers, operator)}"
  end

end

class Advanced_calculator

  def get_operator
    puts 'Which operation would you like to use:'
    puts '(P)ower'
    puts '(S)quare root'
    choice = gets.chomp
    if    choice.downcase == 'p' then return 'to the power of'
    elsif choice.downcase == 's' then return 'square rooted'
    else
      puts "That's not right..."
      return 'p'
    end
  end

  def is_number? string
    return true if Float(string) rescue false
  end
end

def get_numbers(operator)
    if operator == 'to the power of'
      puts ''
      puts 'Please select your numbers'
      num1 = gets.chomp
      num2 = gets.chomp
      if is_number?(num1) then num1 = num1.to_f
      else
        puts "I don't think #{num1} is a number"
        num1 = 1.0
      end
      if is_number?(num2) then num2 = num2.to_f
      else
        puts "I don't think #{num2} is a number"
        num2 = 1.0
      end
      return [num1, num2]
    elsif operator == 'square rooted'
      puts ''
      puts 'Please select your number to square root'
      num1 = gets.chomp
      if is_number?(num1) then num1 = num1.to_f
      else
        puts "I don't think #{num1} is a number"
        num1 = 1.0
      end
      return [num1, '']
    else
      puts 'That\'s not right...'
    end
  end

  def get_answer numbers, operator
    if    operator == 'to the power of' then return numbers[0]**numbers[1]
    elsif operator == 'square rooted' then return numbers[0]**0.5
    else
      puts "That's not right"
    end
  end

  def on_run
    operator = get_operator
    numbers = get_numbers(operator)
    puts "#{numbers[0]} #{operator} #{numbers[1]} = #{get_answer(numbers, operator)}"
  end
main
