class View
  def display(recipes)
    puts "="*40
    puts "          👇 YOUR RECIPES 👇"
    puts "="*40
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[✔]" : "[❌]"
      puts "#{index + 1}. #{status} #{recipe.name}: #{recipe.time_prep} mn | #{recipe.description}"
    end
  end

  def ask_user_for(answer)
    puts "#{answer.capitalize}?"
    print "👉 > "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Which Index ?"
    print "👉 > "
    return gets.chomp.to_i - 1
  end
end
