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

  def reporte_mail (reporte,user)
    @reporte = reporte
    mail(to: user.email, subject: 'Reporte '+reporte.tipo.humanize.downcase+'.')
  end

  def respuesta_mail (respuesta)
    @respuesta = respuesta
    @comentario = respuesta.comentario
    @duenocom = @comentario.usuario
    @favor = @comentario.favor
    @duenogau = @favor.usuario
    @remitente = respuesta.usuario
    if (remitente != @duenocom)
      mail(to: @duenocom.email, subject: 'Han respondido a tu comentario en la gauchada "'+@favor.titulo+'".')
    end
    if (remitente != dueñogau)
      mail(to: @duenogau.email, subject: 'Han respondido a un comentario en tu gauchada "'+@favor.titulo+'".')
    end
  end

  def comentario_mail (comentario)
    @comentario = comentario
    @favor = comentario.favor
    @duenogau = @favor.usuario
    @remitente = comentario.usuario
    if (remitente != duenogau)
      mail(to: @duenogau.email, subject: 'Han comentado tu gauchada "'+@favor.titulo+'".')
    end
  end

  def resolvio_gauchada(gau)
    @gauchada = gau
    @duenogau = Usuario.find(@gauchada.usuario_id)
    @user = Usuario.find(@gauchada.get_elegido)
    mail(to: @user.email, subject: 'Has ganado un punto')
  end
  def no_resolvio_gauchada(gau)
    @gauchada = gau
    @duenogau = Usuario.find(@gauchada.usuario_id)
    @user = Usuario.find(@gauchada.get_elegido)
    mail(to: @user.email, subject: 'Has perdido un punto')
  end

end
