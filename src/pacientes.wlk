class Paciente {
	const property edad 
	var fortalezaMuscular
	var nivelDeDolor
	const rutina = []
	
	method nivelDeDolor() = nivelDeDolor
	method fortalezaMuscular() = fortalezaMuscular
	method puedeUsar(unAparato) = unAparato.puedeSerUsadoPor(self)
	
	method usarAparato(unAparato) {
		if(!self.puedeUsar(unAparato)) {
			self.error("El paciente no puede usar ese aparato")
		}
		unAparato.efectoDelUso(self)
		fortalezaMuscular += unAparato.valorQueSumaFortaleza(self)
		nivelDeDolor = 0.max(nivelDeDolor - unAparato.valorQueRestaDolor(self))
	}
	
	method asignarRutina(listaDeAparatos) {
		rutina.addAll(listaDeAparatos)
	}
	
	method puedeRealizarRutina() = rutina.all({a=> self.puedeUsar(a)})
	
	method realizarRutina() {
		if(!self.puedeRealizarRutina()) {
			self.error("El paciente no puede hacer la rutina porque contiene aparatos que no puede usar")
		}
		rutina.forEach({a => self.usarAparato(a)})
	}
}

class Resistente inherits Paciente {
	override method realizarRutina() {
		super()
		fortalezaMuscular += rutina.size()
	}
}

class Caprichoso inherits Paciente {
	override method puedeRealizarRutina() = super() && self.hayAparatoRojo()
	method hayAparatoRojo() = rutina.any({a=>a.color() == "rojo"})
	override method realizarRutina() {
		(1..2).forEach({e=> super()})
	}
}

class RapidaRecuperacion inherits Paciente {
	override method realizarRutina() {
		super()
		nivelDeDolor = 0.max(nivelDeDolor - coeficienteDeRecuperacion.valor())
	}
}

object coeficienteDeRecuperacion {
	var property valor = 3
}