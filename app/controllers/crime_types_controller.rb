class CrimeTypesController < ApplicationController
  # GET /crime_types
  # GET /crime_types.json
  def index
    @crime_types = CrimeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crime_types }
    end
  end

  # GET /crime_types/1
  # GET /crime_types/1.json
  def show
    @crime_type = CrimeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crime_type }
    end
  end

  # GET /crime_types/new
  # GET /crime_types/new.json
  def new
    @crime_type = CrimeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crime_type }
    end
  end

  # GET /crime_types/1/edit
  def edit
    @crime_type = CrimeType.find(params[:id])
  end

  # POST /crime_types
  # POST /crime_types.json
  def create
    @crime_type = CrimeType.new(params[:crime_type])

    respond_to do |format|
      if @crime_type.save
        format.html { redirect_to @crime_type, notice: 'Crime type was successfully created.' }
        format.json { render json: @crime_type, status: :created, location: @crime_type }
      else
        format.html { render action: "new" }
        format.json { render json: @crime_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crime_types/1
  # PUT /crime_types/1.json
  def update
    @crime_type = CrimeType.find(params[:id])

    respond_to do |format|
      if @crime_type.update_attributes(params[:crime_type])
        format.html { redirect_to @crime_type, notice: 'Crime type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crime_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_types/1
  # DELETE /crime_types/1.json
  def destroy
    @crime_type = CrimeType.find(params[:id])
    @crime_type.destroy

    respond_to do |format|
      format.html { redirect_to crime_types_url }
      format.json { head :no_content }
    end
  end
end
