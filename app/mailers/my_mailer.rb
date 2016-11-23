class MyMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  default from: 'unagauchada.recovery@gmail.com' 
  def elegido_mail (postu)
  	@usuario=Usuario.find(postu.usuario_id)
  	@gauchada=Favor.find(postu.favor_id)
  	@dueno=Usuario.find(@gauchada.usuario_id)

  	mail(to: @usuario.email, subject: 'Has sido elegido para resolver una gauchada!')
  end

  def nuevo_candidato(postu)
    @usuario=Usuario.find(postu.usuario_id)
    @gauchada=Favor.find(postu.favor_id)
    @dueno=Usuario.find(@gauchada.usuario_id)
    @argumento = postu.descripcion
    mail(to: @dueno.email, subject: 'Nuevo candidato para tu gauchada')
  end

end
