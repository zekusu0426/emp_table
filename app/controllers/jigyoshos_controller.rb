# == Schema Information
#
# Table name: jigyoshos
#
#  id         :integer          not null, primary key
#  cd         :string(10)       not null
#  name       :string(60)       not null
#  ryakusho   :string(30)       not null
#  from_ymd   :integer          not null
#  to_ymd     :integer
#  mail       :string(50)
#  sort_num   :integer
#  flg        :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JigyoshosController < ApplicationController
  before_action :set_jigyosho, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /jigyoshos
  # GET /jigyoshos.json
  def index
    @jigyoshos = Jigyosho.order(sort_column + ' ' + sort_direction)
    # @jigyoshos = Jigyosho.where(flg: 1)
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Jigyosho.column_names.include?(params[:sort]) ? params[:sort] : "sort_num"
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

  def logical_destroy
    jigyosho = Jigyosho.find(params[:id])
    jigyosho.update_flg
    redirect_to jigyoshos_path
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
