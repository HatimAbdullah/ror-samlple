class User < ApplicationRecord
  validates :name, presence: true
  validates :mobile_number, length: { maximum: 10 }
  acts_as_xlsx
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :filter_by_name, -> (name) { where("name like ?", "#{name}%")}
  scope :filter_by_gender, -> (given_gender) { where gender: given_gender }
end
