# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  emp_id      :string(8)        not null
#  name        :string           not null
#  jigyosho_id :string
#  birthday    :integer          not null
#  phone1      :string
#  phone2      :string
#  zip         :string(8)        not null
#  address     :string
#  other       :string(100)
#  flg         :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :logical_delete]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '対象のデータを論理削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:emp_id, :name, :jigyosho_id, :birthday, :phone1, :phone2, :zip, :address, :other, :flg)
    end
end
