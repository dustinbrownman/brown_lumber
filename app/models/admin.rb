class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable, :trackable, and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable
end
