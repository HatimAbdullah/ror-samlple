class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  def show
    @user = User.find_by_id(params[:id])
  end
  def show_image
    @user = User.find(params[:id])
    send_data @user.cv, :type => 'image/png',:disposition => 'inline'
  end
  def delete_user
    if (current_user.admin)
      @user = User.find(params[:id])
      @user.delete()
    end
    redirect_back(fallback_location: index)
  end
  def edit_form
    @user = User.find_by_id(params[:id])
  end
  def edit_user
    if (current_user.admin)
      @user = User.find_by_id(params[:id])
      @user.name = params[:name]
      @user.gender = params[:gender]
      @user.mobile_number = params[:mobile_number]
      @user.email = params[:email]
      @user.save
    end
    redirect_back(fallback_location: index)
  end
  def search
    @users = User.filter_by_name(params[:search])
  end
  def bygender
    @users = User.filter_by_gender(params[:gender])
  end
  def excel
    @users = User.all
    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename=users.xlsx"
      }
      format.html { render :excel }
    end
  end
end
