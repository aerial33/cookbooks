class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "           ----             "
    puts "  Welcome to your Cookbook! 🎉 "
    puts "           ----             "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.mark_as_done
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Create a new recipe"
    puts "3 - Destroy a recipe"
    puts "4 - Mark recipe as done"
    puts "5 - Stop and exit the program"
    print "> 👉 "
  end
end
