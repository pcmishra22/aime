class Guardian::ProfilesController < Guardian::AppController
  layout 'parent'

  skip_before_action :authorize_guardian!, only: [:new, :create]

  def index
    render json: current_user.guardian
    return
  end

  def new

    # Student has already their profile created
    redirect_to edit_guardian_profile_path if current_guardian

    @parent = Guardian.new
  end

  def create
    @parent = Guardian.new(parent_params)
    @parent.user = current_user


    respond_to do |format|
      if @parent.save
        format.html { redirect_to parent_profile_path, notice: 'Your guardian profile created successfully' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @parent = current_guardian
    @courses = {1=>"Science",2=>"Math"}
  end

  def update
    @parent = current_guardian
    if(@parent.update(parent_params))
      redirect_to parent_profile_path(current_guardian) , :notice=>'Profile Successfully Updated.'
    else
      render :edit
    end
  end

  def show

  end

  def parent_params
    params.require(:guardian).permit :first_name, :last_name, :profile_photo_url
  end


end