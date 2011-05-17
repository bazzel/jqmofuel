class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :locale, :volume_id

  # == Associations
  has_many :cars, :dependent => :destroy
  has_many :refuelings, :through => :cars
  belongs_to :volume

  # == Validations
  validates_presence_of :volume

  # == Callbacks
  after_initialize :init

  private
    def init
      self.volume ||= Volume.find_first_by_unit('l')
    end
end
