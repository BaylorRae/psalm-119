class VersesController < ApplicationController
  def index
    @verses = Verse.order(:number)
  end

  def show
    @verse = Verse.find_by(number: params[:number])
  end
end
