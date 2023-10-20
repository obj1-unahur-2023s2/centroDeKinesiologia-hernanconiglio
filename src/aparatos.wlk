import pacientes.*

class Aparato {
	const property color = "blanco"
	method puedeSerUsadoPor(unPaciente) = true
	method valorQueSumaFortaleza(unPaciente) = 0
	method valorQueRestaDolor(unPaciente) = 0
	method efectoDelUso(unPaciente)
	method necesitaMantenimiento() = false
	method recibirMantenimiento() {}
}

class Magneto inherits Aparato {
	var imantacion = 800
	override method valorQueRestaDolor(unPaciente) = unPaciente.nivelDeDolor() * 0.1
	override method efectoDelUso(unPaciente) {imantacion = 0.max(imantacion-1)}
	override method necesitaMantenimiento() = imantacion < 100
	override method recibirMantenimiento() {imantacion = 800.min(imantacion+500)}

}

class Bici inherits Aparato {
	var cantTornillos = 0
	var cantAceite = 0
	method cantAceite() = cantAceite
	method cantTornillos() = cantTornillos
	override method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8
	override method valorQueSumaFortaleza(unPaciente) = 3
	override method valorQueRestaDolor(unPaciente) = 4
	override method efectoDelUso(unPaciente) {
		if(unPaciente.nivelDeDolor()>30) {
			cantTornillos++
		}
		if(unPaciente.edad().between(30,50)) {
			cantAceite++
		}
	}
	override method necesitaMantenimiento() = cantTornillos >= 10 || cantAceite >= 5
	override method recibirMantenimiento() {
		cantTornillos = 0
		cantAceite = 0
	}
}

class Minitramp inherits Aparato {
	override method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDeDolor() < 20
	override method valorQueSumaFortaleza(unPaciente) = unPaciente.edad() * 0.1
	override method efectoDelUso(unPaciente) {}
}

