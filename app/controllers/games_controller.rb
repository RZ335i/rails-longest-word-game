require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a.sample }.join
  end

  def english_word(qqch)
    url = "https://wagon-dictionary.herokuapp.com/#{qqch}"
    word_dictionary = URI.open(url)
    word = JSON.parse(word_dictionary.read)
    word['found']
  end

  def letter_in_grid
    @dernier = @answer.chars.sort.all? { |letter| @grid.include?(letter) }
  end

  def score
    @attempt = params[:mot]
    @stock = english_word(@attempt)
    grid = session[:grid]
    @result = @attempt, grid
  end
end
