class Solicitante {

	method puedeSerAtendido(profesional)
	
	method recibirServicio(empleado)

}

class Persona inherits Solicitante {

	var property provincia

	override method puedeSerAtendido(profesional) {
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}
	
	override method recibirServicio(empleado){
		empleado.cobrar(empleado.honorariosPorHora())
	}
}

class Institucion inherits Solicitante {

	var universidadesReconocidas = #{}

	override method puedeSerAtendido(profesional) {
		return universidadesReconocidas.contains(profesional.universidad())
	}
	
	override method recibirServicio(empleado){
		empleado.cobrar(empleado.honorariosPorHora())
	}

}

