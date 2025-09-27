import cosas.*
object camion {
    var property carga=[]
   
     
    method cargar(unaCosa) {unaCosa.add(carga)
    }
    method descargar(unaCosa) {
      unaCosa.remove(carga)
    } 
    method peso() {return 1000 + carga.sum({c=>c.peso()})}
    method pesoParCarga() { return carga.all({c=>c.esPesoPar()})}//carga.all({c=>c.peso().even()})
    method algunaCosaPesa(valor) { return carga.any({c=>c.peso()==valor})
    } 
    method unObjetoPesa(valor) {
     return  carga.any({c=>c.peso()==valor})
    }


    method primerCargaConPeligrosidad(valor) {
      return  carga.find({c=>c.nivelPeligrosidad()==valor})}


    method cargaConPeligrosidad(valor) 
    {return  carga.filter({c=>c.nivelPeligrosidad()==valor})}


    method todasCosasNivelPeligrosidad(valor) 
    {return carga.filter({c=>c.nivelPeligrosidad()>valor})}


    method cosasNivelPeligrosidad(unaCosa) {return carga.filter({c=>c.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()})
    }
    method estaExcedidoDePeso() {
     return  self.peso() > 2500
    }

    method puedeCircularEnRuta(nivelPeligrosidad) {
      return !self.estaExcedidoDePeso() && self.todasCosasNivelPeligrosidad(nivelPeligrosidad).isEmpty() 
    }

    method cosaPesadaEntreMaxMin(primerValor,segundoValor) {
      carga.any({unaCosa=>unaCosa.peso().between(primerValor, segundoValor)})
    }

    method cosaMasPesada() {
      carga.max({unaCosa=>unaCosa.peso()})
    }


}