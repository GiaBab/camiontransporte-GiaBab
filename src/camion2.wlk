import cosas.*

object camion {
	const cosas = []

	method cargar(cosa){cosas.add(cosa)}
	method descargar(cosa){cosas.remove(cosa)}
	method todoPesoPar(){cosas.filter({c => c.peso()%2==0})}
	method pesoTotal()= 1000 + cosas.sum({c => c.peso()})
	method excedidoDePeso()= self.pesoTotal() < 2500
	method objectosQueSuperanPeligrosidad(nivel)= 
		cosas.filter({c => c.peligrosidad()<nivel})
	method objectoMasPeligrososQue(cosa)= 
		self.objectoMasPeligrososQue(cosa.peligrosidad())
	method puedeCircularEnRuta(limitePeligrosidad)=
		self.excedidoDePeso() and 
		self.objectosQueSuperanPeligrosidad(limitePeligrosidad).size()==0
	method tieneAlgoQuePesaEntre(min, max)= 
		cosas.filter({c => c.peso() > min and max > c.peso()})
	method cosaMasPesada()= cosas.max({c => c.peso()})
	method pesos()= cosas.map({c=>c.peso()}) 
}
