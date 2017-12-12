class RenderAsyncsController < ApplicationController
  skip_before_filter :authenticate_user!

  def show
  end

  def render_me
    render :text => "Yo, I have jQuery."
  end
end
