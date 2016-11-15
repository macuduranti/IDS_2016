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
