class Recipe

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @time_prep = attributes[:time_prep]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end
