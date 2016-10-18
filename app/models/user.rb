class User < ActiveRecord::Base
  has_many :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  validates_confirmation_of :password, :on => :create
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :on => :create
  validates :password, :confirmation => true ,:presence => true, :on => :create
  validates_length_of :password, :in => 6..20, :on => :create

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
