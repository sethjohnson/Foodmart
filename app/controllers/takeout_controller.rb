class TakeoutController < ApplicationController
  def index
        @text = params[:q]
    if (@text != nil)
    @items =
      Food.find(
        :all, :conditions => ["UPPER(name) LIKE ?", "#{@text.upcase}%"]).sort!{
        |a,b| a.name.downcase <=> b.name.downcase
      }
    else
       @items =
      Food.all
    end
    render :layout => false
  end
end
