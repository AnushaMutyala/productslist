class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable,  :validatable
  #include DeviseTokenAuth::Concerns::User
  has_many :products, dependent: :destroy
  ROLES = %i[admin author]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.rolem = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
         
  def roles
    ROLES.reject do |r|
      ((rolem.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end
         
  def has_role?(role)
    roles.include?(role)
  end
end