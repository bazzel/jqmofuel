class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :locale, :mileage_id

  # == Associations
  has_many :cars, :dependent => :destroy
  has_many :refuelings
  belongs_to :mileage

  # == Validations
  validates_presence_of :mileage

  class << self
    def new_default(attrs={})
      # Accept :mileage as attributes key,
      # but use :mileage_id internally.
      # Note: attr_accessible doesn't have to include :mileage this way.
      mileage = attrs.delete(:mileage)
      attrs[:mileage_id] = mileage.id if mileage

      default_attributes = {
        :mileage_id => Mileage.find_by_unit('mi').id
      }
      user = new(default_attributes.merge(attrs))
    end
  end

end
