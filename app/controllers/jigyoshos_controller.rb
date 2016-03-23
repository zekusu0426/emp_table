class JigyoshosController < ApplicationController
  before_action :set_jigyosho, only: [:show, :edit, :update, :destroy]

  # GET /jigyoshos
  # GET /jigyoshos.json
  def index
    @jigyoshos = Jigyosho.all
  end

  # GET /jigyoshos/1
  # GET /jigyoshos/1.json
  def show
  end

  # GET /jigyoshos/new
  def new
    @jigyosho = Jigyosho.new
  end

  # GET /jigyoshos/1/edit
  def edit
  end

  # POST /jigyoshos
  # POST /jigyoshos.json
  def create
    @jigyosho = Jigyosho.new(jigyosho_params)

    respond_to do |format|
      if @jigyosho.save
        format.html { redirect_to @jigyosho, notice: 'Jigyosho was successfully created.' }
        format.json { render :show, status: :created, location: @jigyosho }
      else
        format.html { render :new }
        format.json { render json: @jigyosho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jigyoshos/1
  # PATCH/PUT /jigyoshos/1.json
  def update
    respond_to do |format|
      if @jigyosho.update(jigyosho_params)
        format.html { redirect_to @jigyosho, notice: 'Jigyosho was successfully updated.' }
        format.json { render :show, status: :ok, location: @jigyosho }
      else
        format.html { render :edit }
        format.json { render json: @jigyosho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jigyoshos/1
  # DELETE /jigyoshos/1.json
  def destroy
    @jigyosho.destroy
    respond_to do |format|
      format.html { redirect_to jigyoshos_url, notice: 'Jigyosho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jigyosho
      @jigyosho = Jigyosho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jigyosho_params
      params.require(:jigyosho).permit(:cd, :name, :ryakusho, :from_ymd, :to_ymd, :mail, :sort_num, :flg)
    end
end