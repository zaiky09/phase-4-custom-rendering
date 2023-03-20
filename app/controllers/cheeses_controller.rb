class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:updated_at, :created_at]
    else
      render json: {error: "Couldn't find cheese"}, status: 404
    end
  
  end

end
