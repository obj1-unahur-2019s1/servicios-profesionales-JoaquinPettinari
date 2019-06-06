class Empresa {

	const property empleados = #{}
	var property honorarioDeReferencia = 0
	const clientes = #{}

	method contratarEmpleado(quien) {
		empleados.add(quien)
	}

	method empleadosDeUniversidad(universidad) {
		return empleados.count{ empleado => empleado.universidad().equals(universidad) }
	}

	method empleadosCaros() {
		return empleados.filter{ empleado => empleado.honorariosPorHora() > honorarioDeReferencia }.asSet()
	}

	method universidadesDeLosEmpleados() {
		return empleados.map{ profesional => profesional.universidad() }.asSet()
	}

	method esGenteAcotada() {
		return empleados.all{ profesional => profesional.provinciasDondePuedeTrabajar().size() <= 3 }
	}

	method personalMasBarato() {
		return empleados.min{ empleado => empleado.honorariosPorHora() }
	}

	method puedeSatisfacerAlCliente(cliente) {
		return empleados.any{ profesional => cliente.puedeSerAtendido(profesional) }
	}

	method empleado(cliente) { //anyOne
		return empleados.find{ profesional => cliente.puedeSerAtendido(profesional) }
	}
	
	method darServicioPara(quien){
		if (self.puedeSatisfacerAlCliente(quien)) {
			quien.recibirServicio(self.empleado(quien))
			clientes.add(quien)
		}
		else{ "error"}
	}
	
	method darServicio(quien) {
		self.darServicioPara(quien)	
	}
	
	method cuantosClientesTengo(){
		return clientes.size()
	}
	
	method tengoAEsteCliente(quien){
		return clientes.contains(quien)
	}
	
	method esPocoAtractivo(empleado){
		return empleados.any{ profesional => 
			(profesional.provinciasDondePuedeTrabajar() == empleado.provinciasDondePuedeTrabajar()) &&
			(profesional.honorariosPorHora() < empleado.honorariosPorHora())
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

