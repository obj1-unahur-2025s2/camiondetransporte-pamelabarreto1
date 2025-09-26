object knightRider {
    method peso() = 500
    method nivelPeligrosidad() = 10
    method esPesoPar() = self.peso().even()
}

object bumblebee {
    var esAuto = true
    method peso() = 800
    method transformateEnAuto() {
        esAuto = true
    }
    method transformateEnRobot() {
        esAuto = false
    }
    method nivelPeligrosidad() = if(esAuto) 15 else 30
    method esPesoPar() = self.peso().even()
}

object ladrillos {
    var cantidad = 10
    method cantidad(nuevaCantidad) {
        cantidad = nuevaCantidad
    }
    method peso() = 2 * cantidad
    method nivelPeligrosidad() = 2
    method esPesoPar() = self.peso().even()
}

object arena {
    var property peso = 0
    method nivelPeligrosidad() = 1
    method esPesoPar() = self.peso().even()
}

object bateriaAntiaerea {
    var estaConMisiles = false
    method cargarMisiles() {
        estaConMisiles = true
    }
    method descargarMisiles() {
        estaConMisiles = false
    }
    method peso() = if(estaConMisiles) 300 else 200
    method nivelPeligrosidad() = if(estaConMisiles) 100 else 0
    method esPesoPar() = self.peso().even()
}

object contenedor {
    const cosasAdentro = []
    method agregar(unaCosa) {
        cosasAdentro.add(unaCosa)
    }
    method agregarVarias(variasCosas) {
        cosasAdentro.addAll(variasCosas)
    }
    method quitarCosa(unaCosa) {
        cosasAdentro.remove(unaCosa)
    }
    method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()})
    method nivelPeligrosidad() =
        if(cosasAdentro.isEmpty()) return 0 
        else return cosasAdentro.max({c => c.nivelPeligrosidad()}).nivelPeligrosidad()
    method esPesoPar() = self.peso().even()
}

object residuos {
    var property peso = 0
    method nivelPeligrosidad() = 200
    method esPesoPar() = self.peso().even()
    method nuevoPeso(unPeso) {peso=unPeso}
}

object embalaje {
    var cosaEnvuelta = arena
    method envolver(unaCosa) {
        cosaEnvuelta = unaCosa
    }
    method peso() = cosaEnvuelta.peso()
    method nivelPeligrosidad() = cosaEnvuelta.nivelPeligrosidad() / 2
    method esPesoPar() = self.peso().even()
}