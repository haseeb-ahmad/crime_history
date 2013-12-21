class StateCrimesController < ApplicationController
  # GET /state_crimes
  # GET /state_crimes.json
  def index
    @state_crimes = StateCrime.all
    dataa = Hash.new
    inerdata = []
    i = 0
    if params[:year]
      dataa["year"] = params[:year]
      i = 1
    end
    if params[:crime_id]
      dataa["crime_id"]  = params[:crime_id]
      i = 1
    end
    if params[:crime]
      dataa["crime_id"]  = Crime.find_all_by_name(params[:crime]).first.id
      i = 1
    end
    if params[:count]
      dataa["count"] = params[:count]
      i = 1
    end
    if params[:crime_type_id]
        @iner = Crime.find_all_by_crime_type_id(params[:crime_type_id])
        ind = 0
        @iner.each do |i|
          inerdata.push(i.id)
          #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#{i.id}"
        end

      dataa["crime_id"] = inerdata
      i = 1
    end
    if params[:crime_type]
      @iner = Crime.find_all_by_crime_type_id(CrimeType.find_all_by_name(params[:crime_type]).first.id)
      ind = 0
      @iner.each do |i|
        inerdata.push(i.id)
        #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa#{i.id}"
      end

      dataa["crime_id"] = inerdata
      i = 1
    end
    if params[:state]
      #@state_crimes = StateCrime.find_all_by_state_id(params[:state])
      dataa["state_id"] = params[:state]
      i = 1
    end
    if params[:state_id]
      #@state_crimes = StateCrime.find_all_by_state_id(params[:state])
      dataa["state_id"] = State.find_all_by_name(params[:state]).first.id
      i = 1
    end

    #where condition clause is finalized here

    if i == 0
      @state_crimes = StateCrime.all
    else
      @state_crimes = StateCrime.where(dataa)
    end
    reponse_hash = Hash.new
    k = 0

    @state_crimes.each do  |i|
      j = i.id
      s_hash = Hash.new
      #@item = MenuItem.find_all_by_menu_section_id(j)
      s_hash["year"] = i.year
      s_hash["count"] = i.count
      s_hash["state"] = i.state.name
      s_hash["crime"] = i.crime.name
      s_hash["crime_type"] = i.crime.crime_type.name
      reponse_hash[k] = s_hash
      k = k + 1
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: reponse_hash  }
    end
  end

  # GET /state_crimes/1
  # GET /state_crimes/1.json
  def show
    @state_crime = StateCrime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @state_crime }
    end
  end

  # GET /state_crimes/new
  # GET /state_crimes/new.json
  def new
    @state_crime = StateCrime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state_crime }
    end
  end

  # GET /state_crimes/1/edit
  def edit
    @state_crime = StateCrime.find(params[:id])
  end

  # POST /state_crimes
  # POST /state_crimes.json
  def create
    @state_crime = StateCrime.new(params[:state_crime])

    respond_to do |format|
      if @state_crime.save
        format.html { redirect_to @state_crime, notice: 'State crime was successfully created.' }
        format.json { render json: @state_crime, status: :created, location: @state_crime }
      else
        format.html { render action: "new" }
        format.json { render json: @state_crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /state_crimes/1
  # PUT /state_crimes/1.json
  def update
    @state_crime = StateCrime.find(params[:id])

    respond_to do |format|
      if @state_crime.update_attributes(params[:state_crime])
        format.html { redirect_to @state_crime, notice: 'State crime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state_crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_crimes/1
  # DELETE /state_crimes/1.json
  def destroy
    @state_crime = StateCrime.find(params[:id])
    @state_crime.destroy

    respond_to do |format|
      format.html { redirect_to state_crimes_url }
      format.json { head :no_content }
    end
  end


end
