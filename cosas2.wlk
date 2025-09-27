object knightRider {
  
  method peso() =500
  
  method nivelPeligrosidad() =10
  
  method esPesoPar() =self.peso().even()

  method bulto()= 1

  method consecuenciaDeLaCarga() {} 
  
}

object bumblebee {
    var esAuto=true
  
  method peso() =800
  
  method nivelPeligrosidad() {
    if(esAuto){15}
    else{ 30}
  }
  method tranformarEnAuto() {esAuto=true
    
  }
  method transformarEnRobot() {esAuto=false}

  method esPesoPar() =self.peso().even()  

 method bulto()= 2

  method consecuenciaDeLaCarga() {self.transformarEnRobot()} 
  }

object ladrillos {
  var cantidad=10

  method cantLadrillos(nuevaCant) {cantidad=nuevaCant}

  method peso()= 2 * cantidad

  method nivelPeligrosidad() = 2 
  
  method esPesoPar() = self.peso().even()  


 method bulto(){if(cantidad<=100){1}
                else if(cantidad.between(101, 300)){2}
                else {3}}
 

 
  method consecuenciaDeLaCarga() {cantidad=cantidad+12} 
  
 }


object arena {
  var property peso = 0

  method nivelPeligrosidad() =1

  method esPesoPar() =self.peso().even()

   method bulto()= 1


  method consecuenciaDeLaCarga() {peso=peso-10.max(0)} 
  
}

object bateraAntiaerea {
  var estaConMisiles=true
  
  method peso() =if(estaConMisiles){300}
  else{200}
  
    
  

  method nivelPeligrosidad() =if(estaConMisiles){100}
  else{0}
    
  
  method descargarMisiles() {estaConMisiles=false
  }
  method cargarMisiles() {estaConMisiles=true
    
  }

  method esPesoPar()= self.peso().even()
  
  method bulto() {if(estaConMisiles){2}else{1}
    
  }

  
  method consecuenciaDeLaCarga() {self.cargarMisiles()} 
  

}

object contenedor {
  const cosasAdentro=[]

   method agregar(unaCosa) {
     cosasAdentro.add(unaCosa)
   }
   method agregarVariasCosas(variasCosas) {
     cosasAdentro.addAll(variasCosas)
   }
   method sacar(unaCosa) {
     cosasAdentro.remove(unaCosa)
   }
  method peso()= 100 + cosasAdentro.sum({cosas=>cosas.peso()})
    

  method nivelPeligrosidad() {if(cosasAdentro.isEmpty()){0} 
 else{ cosasAdentro.max({cosas=>cosas.nivelPeligrosidad()}).nivelPeligrosidad() 
}
}

  method esPesoPar()=self.peso().even()
   

   method bulto() = 1 + cosasAdentro.sum({cosas=>cosas.bulto()})

   
  method consecuenciaDeLaCarga() {cosasAdentro.forEach({cosas=>cosas.consecuenciaDeLaCarga()})} 
  
}

object residuos {
  var  property  peso=10
  method nivelPeligrosidad() =200 

  method esPesoPar()=self.peso().even()

   method bulto()= 1

   
  method consecuenciaDeLaCarga() {peso=peso+15} 
  
}



object embalaje {
  var cosaEnvuelta = arena
  method envolver(unaCosa) {
    cosaEnvuelta=unaCosa
  }
  method peso()= cosaEnvuelta.peso()

  method nivelPeligrosidad() {return cosaEnvuelta.nivelPeligrosidad()/2} 

  method esPesoPar()=self.peso().even()

 method bulto()= 2


  method consecuenciaDeLaCarga() {} 
  
}

