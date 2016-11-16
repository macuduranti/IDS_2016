module ApplicationHelper

    def error_para(model, attribute)
        if model.errors[attribute].present?
            content_tag :span, :class => "'error_explanation'" do
                model.errors[attribute].join(", ")
            end
        end
    end

    def error_atributo(attribute)
        if resource.errors[attribute].present?
            content_tag :span, :class => "'error_explanation'" do
                resource.errors[attribute].join(", ")
            end
        end
    end

    def calc_logro(pts)
        logros = Logro.all.order(:puntosMin)
        if (logros.first.puntosMin > pts)
            return 'Sin logro'
        else
            logros.each do |l|
                if (pts >= l.puntosMin)
                    @log = l.etiqueta
                else
                    return @log
                end
            end
            return @log
        end
    end    

    def calc_logro_de(uid)
        pts = Usuario.find(uid).puntos
        logros = Logro.all.order(:puntosMin)
        if (logros.first.puntosMin > pts)
            return 'Sin logro'
        else
            logros.each do |l|
                if (pts >= l.puntosMin)
                    @log = l.etiqueta
                else
                    return @log
                end
            end
            return @log
        end
    end   

    private

    def verificar_admin
        (current_usuario.nil?) ? redirect_to(root_path, alert: 'No puedes acceder a esa página.') : (redirect_to(root_path, alert: 'No puedes acceder a esa página') unless usuario_signed_in?)
    end
 
    def verificar_usuario
        (current_usuario.nil?) ? redirect_to(root_path, alert: 'No puedes acceder a esa página.') : (redirect_to(root_path, alert: 'No puedes acceder a esa página') unless current_usuario.admin?)
    end

    def usuario_es_admin? 
        if usuario_signed_in? then
  		    current_usuario.admin
        end
  	end

 	def opciones_para_ubicacion
  	[
    	["Buenos Aires","Buenos Aires"],
    	["Buenos Aires Capital","Buenos Aires Capital"],
    	["Catamarca","Catamarca"],
    	["Chaco","Chaco"],
    	["Chubut","Chubut"],
    	["Cordoba","Cordoba"],
    	["Corrientes","Corrientes"],
    	["Entre Rios","Entre Rios"],
    	["Formosa","Formosa"],
    	["Jujuy","Jujuy"],
    	["La Pampa","La Pampa"],
    	["La Rioja","La Rioja"],
    	["Mendoza","Mendoza"],
    	["Misiones","Misiones"],
    	["Neuquen","Neuquen"],
    	["Rio Negro","Rio Negro"],
    	["Salta","Salta"],
    	["San Juan","San Juan"],
    	["San Luis","San Luis"],
    	["Santa Cruz","Santa Cruz"],
    	["Santa Fe","Santa Fe"],
    	["Santiago del Estero","Santiago del Estero"],
    	["Tierra del Fuego","Tierra del Fuego"],
    	["Tucuman","Tucuman"]
  	]
  	end
end
