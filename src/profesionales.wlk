import Universidad.*
import Empresa.*

class Profesional {
	var property universidad
	var property totalRecaudado
	
	method provinciasDondePuedeTrabajar()
	
	method honorariosPorHora()	
	
	method cobrar(cuanto)
}


class ProfesionalAsociado inherits Profesional {
	
	override method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	override method honorariosPorHora() =  3000 
	
	override method cobrar(cuanto){
		asociacionDeProfesionalesdelLitoral.totalRecaudado(cuanto)
	}
}

object asociacionDeProfesionalesdelLitoral{
	var property totalRecaudado = 0
	
	method cobrar(cuanto){
		totalRecaudado += cuanto
	}
}



class ProfesionalVinculado inherits Profesional {
	
	override method provinciasDondePuedeTrabajar() { return #{self.universidad().pronvincias()} }
	
	override method honorariosPorHora(){return self.universidad().honorariosRecomendados() }
	
	override method cobrar(cuanto){
		universidad.donar(cuanto / 2)
	}
	
	
}

class ProfesionalLibre inherits Profesional {
	
	var property pronvinciaDeTrabajo
	var property honorariosPorHora = 0
	
	override method provinciasDondePuedeTrabajar(){
		return pronvinciaDeTrabajo
	}
	
	override method cobrar(cuanto){
		totalRecaudado += cuanto
	}
	
	method pasarDinero(quien, cuanto){
		totalRecaudado -= (totalRecaudado - cuanto).max(0)
		quien.cobrar(cuanto) 
	}
	
	
	
	
}