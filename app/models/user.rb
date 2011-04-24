class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :locale, :mileage_id, :volume_id

  # == Associations
  has_many :cars, :dependent => :destroy
  has_many :refuelings
  belongs_to :mileage
  belongs_to :volume

  # == Validations
  validates_presence_of :mileage
  validates_presence_of :volume

  class << self
    def new_default(attrs={})
      # Accept :mileage as attributes key,
      # but use :mileage_id internally.
      # Note: attr_accessible doesn't have to include :mileage this way.
      mileage = attrs.delete(:mileage)
      attrs[:mileage_id] ||= mileage ? mileage.id : Mileage.find_by_unit('km').id

      volume = attrs.delete(:volume)
      # Note: use +find_first_by_unit+ since unit is a translated attribute.
      attrs[:volume_id] ||= volume ? volume.id : Volume.find_first_by_unit('l').id

      user = new(attrs)
    end
  end

end
