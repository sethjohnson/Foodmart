class TakeoutController < ApplicationController
  def index
     @text = params[:q]
    @items =
      Food.find(
        :all, :conditions => ["UPPER(name) LIKE ?", "#{@text.upcase}%"]).sort!{
        |a,b| a.name.downcase <=> b.name.downcase
      }
    render :layout => false
  end
end
