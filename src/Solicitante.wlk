class Solicitante {

	method puedeSerAtendido(profesional)

}

class Persona inherits Solicitante {

	var property provincia

	override method puedeSerAtendido(profesional) {
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}

}

class Institucion inherits Solicitante {

	var universidadesReconocidas = #{}

	override method puedeSerAtendido(profesional) {
		return universidadesReconocidas.contains(profesional.universidad())
	}

}

