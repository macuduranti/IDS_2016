class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :nombre #, message: 'Campo requerido'
  validates_presence_of :apellido#, message: 'Campo requerido'
  #validates_inclusion_of :es_mujer, in: [true,false]
  #validates_presence_of :foto
  #validates_presence_of :ubicacion
 #validates_presence_of :email#, message: 'Campo requerido'
  #validates_presence_of :password#, message: 'Campo requerido'
  #validates_confirmation_of :password#, message: 'Las contraseñas no coinciden'
  #validates_presence_of :password_confirmation#, message: 'Campo requerido'


  #validates :fecha_de_nacimiento, :presence => true
  validate :validar_edad

  private

  def validar_edad
      if fecha_de_nacimiento.present? && fecha_de_nacimiento.to_i >= 18.years.ago.to_i
          errors.add(:fecha_de_nacimiento, 'Debes ser mayor de 18 años.')
      end
  end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end