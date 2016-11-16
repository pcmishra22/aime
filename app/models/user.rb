class User < ActiveRecord::Base
  has_many :course
  has_many :message

  has_one :student
  has_one :teacher
  has_one :parent

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

end
