class ReportesController < ApplicationController
	include ApplicationHelper
  	before_filter :verificar_admin

	def index
		@reportes = Reporte.all

	end

	def show
		@reporte = Reporte.find(params[:id])
	end

	def new
		@reporte=Reporte.new
	end

	def create
		@reporte=Reporte.new(titulo: params[:reporte][:titulo], tipo: params[:reporte][:tipo], fechainicial: params[:reporte][:fechainicial], fechafinal: params[:reporte][:fechafinal], cantidad: params[:reporte][:cantidad], tipodeusuarios: params[:reporte][:tipodeusuarios], usuario_id: current_usuario.id)
		if not @reporte.tipo == 'de_ganancias'
		usuarios = Usuario.all 
		usuarios.each do |u| 
			if @reporte.tipodeusuarios == 'mas_gauchadas_pedidas'
				pedidas = Favor.where(:usuario_id => u.id).count
				usuariopalrep = Usuarioreporte.new
				usuariopalrep.usuario_id = u.id
				usuariopalrep.cantidad = pedidas
			else
				if @reporte.tipodeusuarios == 'mas_gauchadas_resueltas'
					favores = Favor.where.not(:usuario_id => u.id).where(:resuelta => true)
					count = 0
				    favores.each do |f| 
						flag = false 
						f.postulacions.each do |p| 
							if p.usuario_id == u.id 
								flag = true 
								count = count+1
								break		
							end 
						end 
					end
					usuariopalrep = Usuarioreporte.new
					usuariopalrep.usuario_id = u.id
					usuariopalrep.cantidad = count
				else
					usuariopalrep = Usuarioreporte.new
					usuariopalrep.usuario_id = u.id
					usuariopalrep.cantidad = u.puntos
				end	
			end	
			@reporte.usuarioreportes << usuariopalrep
		end
		end
		if @reporte.tipo == 'de_ganancias' && @reporte.fechainicial >= @reporte.fechafinal
			redirect_to reportes_path, alert: 'Error en las fechas del reporte'
		else 
			@reporte.save
			if @reporte.cantidad.present? 
				if @reporte.usuarioreportes.count > @reporte.cantidad
					cantaborrar = @reporte.usuarioreportes.size - @reporte.cantidad
					@reporte.usuarioreportes.reverse_order.limit(cantaborrar).destroy_all
				end
			end
			redirect_to reporte_path(:id => @reporte.id), notice: 'Reporte creado exitosamente'
		end
	end

	def destroy 
		@reporte = Reporte.find(params[:id])
		@reporte.destroy
		redirect_to reportes_path, notice: "Reporte Eliminado"		
	end

	def enviar
		@reporte = Reporte.find(params[:id])
		MyMailer.reporte_mail(@reporte,current_usuario).deliver_now
		redirect_to reporte_path(:id => params[:id]), notice: 'El correo ha sido enviado'
	end
end