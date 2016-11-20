class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :nombre
  validates_presence_of :apellido

  validate :validar_edad

  has_many :favors, dependent: :destroy

  private

  def validar_edad
      if fecha_de_nacimiento.present? && fecha_de_nacimiento.to_i >= 18.years.ago.to_i
          errors.add(:fecha_de_nacimiento, 'Debes ser mayor de 18 años.')
      end
  end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

end