class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def is_student?
    type == "Student"
  end

  def is_teacher?
    type == "Teacher"
  end

  def is_parent?
    type == "Parent"
  end

  def is_admin?
    type == "Admin"
  end
end
