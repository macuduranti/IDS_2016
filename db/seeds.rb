# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Logro.find_or_create_by(id: 1, etiqueta: "Newbie", puntosMin: 0) then
	puts "Creo logro base"
end

correo = 'unagauchada.recovery@gmail.com'
if not Usuario.exists?(email: correo) then
	user = Usuario.new
	user.email = correo
	user.password = '123456'
	user.password_confirmation = '123456'
	user.nombre = "admin"
	user.apellido = "admin"
	user.foto = "http://orig11.deviantart.net/6147/f/2014/002/c/3/age_of_mythology_zeus__icon__by_geoffery10-d70kj7r.png"
	user.admin = true;
	user.fecha_de_nacimiento = 100.years.ago
	user.ubicacion = "Buenos Aires"
	user.skip_confirmation!
	user.save! 
	puts "Creo usuario admin"
end

correo = 'macuduranti@gmail.com'
if not Usuario.exists?(email: correo) then
	user1 = Usuario.new
	user1.email = correo
	user1.password = '123456'
	user1.password_confirmation = '123456'
	user1.nombre = "Usuario"
	user1.apellido = "Uno"
	user1.foto = "https://i1.sndcdn.com/artworks-000101855428-sa0kfe-t500x500.jpg"
	user1.es_mujer = false;
	user1.fecha_de_nacimiento = 20.years.ago
	user1.ubicacion = "Buenos Aires"
	user1.skip_confirmation!
	user1.save! 
	puts "Creo un usuario común"
end

correo = 'facundo6991@gmail.com'
if not Usuario.exists?(email: correo) then
	user2 = Usuario.new
	user2.email = correo
	user2.password = '123456'
	user2.password_confirmation = '123456'
	user2.nombre = "Usuario"
	user2.apellido = "Dos"
	user2.foto = "https://a2-images.myspacecdn.com/images01/40/0ada34ec69790d5aeda5a7edb1eb8b4e/300x300.jpg"
	user2.es_mujer = true;
	user2.fecha_de_nacimiento = 19.years.ago
	user2.ubicacion = "Buenos Aires"
	user2.skip_confirmation!
	user2.save! 
	puts "Creo otro usuario común"
end

if Favor.find_or_create_by(titulo: 'Necesito ayuda para controlar el sitio', descripcion: 'Ayudaaaaa', foto: 'http://www.nocturnar.com/imagenes/cara-triste/cara-triste.jpg', ubicacion: 'Buenos Aires', usuario_id: 1) then
	puts "Creo un favor para el usuario con id: 1"
end

if Favor.find_or_create_by(titulo: 'Necesito ayuda para publicar una gauchada', descripcion: 'Ayudaaaaa', foto: 'http://www.nocturnar.com/imagenes/cara-triste/cara-triste.jpg', ubicacion: 'Buenos Aires', usuario_id: 2) then
	puts "Creo un favor para el usuario con id: 2"
end

if Favor.find_or_create_by(titulo: 'Ya ta ya lo hice', descripcion: ':)', foto: 'https://image.freepik.com/iconos-gratis/cara-feliz-emoticono-sonriente-con-la-boca-abierta_318-58593.jpg', ubicacion: 'Buenos Aires', usuario_id: 2) then
	puts "Creo otro favor para el usuario con id: 2"
end

if Favor.find_or_create_by(titulo: 'Quiero cambiar mi foto de perfil', descripcion: 'Ayudaaaaa', foto: 'http://www.nocturnar.com/imagenes/cara-triste/cara-triste.jpg', ubicacion: 'Catamarca', usuario_id: 3) then
	puts "Creo un favor para el usuario con id: 3"
end
