require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeMarmiton
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    recipes = []
    url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}"
    html_file = open(url)
    html_doc = Nokogiri::HTML(html_file, nil, 'utf-8')
    html_doc.css(".recipe-card > a").first(10).each do |element|
      name = element.css('.recipe-card__title').text.strip
      description = element.css('.recipe-card__description').text.strip
      time_prep = element.css('.recipe-card__duration__value').text
      recipes << Recipe.new(name: name, description: description, time_prep: time_prep)
    end
    recipes
  end
end
