class Empresa {
	const property empleados = #{} 
	var property honorarioDeReferencia = 0
	
	method contratarEmpleado(quien){
		empleados.add(quien)
	}
	
	method empleadosDeUniversidad(universidad){
		return empleados.count{ empleado => 
			empleado.universidad().equals(universidad)
		}
	}
	
	method empleadosCaros(){
		return empleados.filter{ empleado => 
			empleado.honorariosPorHora() > honorarioDeReferencia
		}.asSet()
	}
	
	method universidadesDeLosEmpleados(){
		return empleados.map{ profesional => profesional.universidad() }.asSet()
	}
	
	method esGenteAcotada(){
		return empleados.all{ profesional => profesional.universidades().size() < 3}
	}
	
	method personalMasBarato(){
		return empleados.min{ empleado => empleado.honorariosPorHora()}
	}
	
	method puedeSatisfacerAlCliente(cliente){
		return empleados.any{ profesional => cliente.puedeSerAtendido(profesional) } 
	}
	
	
}
