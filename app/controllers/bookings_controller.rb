require 'date'
require 'json'

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @current_employee = current_employee
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create    
    if date_available?(booking_params)
      respond_to do |format|
        if @booking.save
          format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: "Booking is already taken." }
        format.json { head :no_content }
      end
    end 
    
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    if date_available?(booking_params)
      respond_to do |format|
        if @booking.update(booking_params)
          format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
          format.json { render :show, status: :ok, location: @booking }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: "Booking is already taken." }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:date, :release, :employee_id)
    end

    def date_available? (booking_params)
      @booking = Booking.new(booking_params)
      @bookings = Booking.all
      searched_booking = @bookings.where(date: booking_params[:date])

      (searched_booking.empty? || searched_booking.last.release == true) ? true : false
    end
end
