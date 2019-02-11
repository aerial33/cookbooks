require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'

CSV_FILE = File.join(__dir__, 'recipes.csv')
cookbook = Cookbook.new(CSV_FILE)
controller = Controller.new(cookbook)

router = Router.new(controller)

router.run
