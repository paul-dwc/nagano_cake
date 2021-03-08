class Public::HomesController < ApplicationController
  def top
    @items = Item.order(updated_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end
end
