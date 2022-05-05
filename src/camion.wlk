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
}
