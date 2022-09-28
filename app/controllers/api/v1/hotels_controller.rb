class Api::V1::HotelsController < ApplicationController
  before_action :logged_in, except: %i[index show]
  before_action :user_ability, except: %i[index show]

  def index
    @hotels = Hotel.all
    render json: { status: 'Success', message: 'loaded hotels', hotels: @hotels }, status: :ok
  end

  def show
    @hotel = Hotel.includes(:reservations).find(params[:id])
    @reservations = @hotel.reservations.order(created_at: :desc)
    render json: { status: 'Success', message: 'loaded hotel', hotel: @hotel, reservations: @reservations },
           status: :ok
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      render json: {
        message: 'Hotel added successfully'
      }, status: :created
    else
      render json: {
        message: 'something went wrong'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    if @hotel.destroy
      render json: { message: 'Hotel deleted succesfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      render json: { message: 'Hotel updated succesfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :price, :description, :country, :city, :address, :image_url, :category_id)
  end

  def user_ability
    authorize! :manage, @hotel
  rescue CanCan::AccessDenied
    render json: { errors: 'You are not authorized to perform this action' },
           status: :unauthorized
  end
end
