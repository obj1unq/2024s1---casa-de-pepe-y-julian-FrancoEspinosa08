object casaDePepeYJulian {
	var viveres = 50
	var montoReparacion  = 0
	method tieneViveresSuficientes(){
		return viveres>40
	}
	method hayQueReparar(){
		return montoReparacion >0
	}
	method casaEnOrden(){
		return not self.hayQueReparar() and self.tieneViveresSuficientes()
	}
	method romper(valor){
		montoReparacion+=valor
	}
	method viveres(){
		return viveres
	}
	method viveres(_viveres){
		viveres=_viveres
	}
	method aumentarViveres(extra){
		viveres=viveres+extra
	}
	method montoReparacion(_montoReparacion){
		montoReparacion=_montoReparacion
	}
	method montoReparacion(){
		return montoReparacion
	}
}
object minimoEIndispensable{
	var calidad=1
	var casa=casaDePepeYJulian
	var cuenta=corriente
	const porcentajeParaLlegarA40=40-casa.viveres()
	method cuentaAsociada(_cuenta){
		cuenta=_cuenta
	}
	method calidad(_calidad){
		calidad=_calidad
	}
	method casa(_casa){
		casa=_casa
	}
	method mantener(){
		if (casa.viveres()<40){
			casa.aumentarViveres(porcentajeParaLlegarA40)
			cuenta.extraer((porcentajeParaLlegarA40)*calidad)
		}
	}
}
object full{
	const calidad=5
	var casa=casaDePepeYJulian
	var cuenta=corriente
	const porcentajeParaLlegarA100=100-casa.viveres()
	method casa(_casa){
		casa=_casa
	}
	method cuentaAsociada(_cuenta){
		cuenta=_cuenta
	}
	method mantener(){
		if(casa.casaEnOrden()){
			casa.aumentarViveres(porcentajeParaLlegarA100)
			cuenta.extraer((porcentajeParaLlegarA100)*calidad)
			self.pagarReparacionesSiEsPosible()
		}
		else {
			casa.aumentarViveres(40)
			cuenta.extraer(40*calidad)
			self.pagarReparacionesSiEsPosible()
		}
		
	}
	method pagarReparacionesSiEsPosible(){
		if(cuenta.saldo()>1000){
			cuenta.extraer(casa.montoReparacion())
		}
	}
}
// si es posible utilizar estas estrategias de ahorro en otras casas mientras mantengan la misma estructura que la casa de pepe y julian ya que lo unico que habria que cambiar es
// seteando la casa en la estrategia y ya se veria afectada por la misma

object pepeYJulian{
	method depositarCorriente(monto){
		corriente.depositar(monto)
	}
	method extraerCorriente(monto){
		corriente.extraer(monto)
	}
	method saldoCuentaCorriente(){
		return corriente.saldo()
	}
	method depositarConGastos(monto){
		gastos.depositar(monto)
	}
	method extraerConGastos(monto){
		gastos.extraer(monto)
	}
	method saldoCuentaConGastos(){
		return gastos.saldo()
	}
	method depositarCombinada(monto){
		combinada.depositar(monto)
	}
	method extraerCombinada(monto){
		combinada.extraer(monto)
	}
	method saldoCuentaCombinada(){
		return combinada.saldo()
	}
}
object corriente{
	var saldo=0
	method depositar(monto){
		saldo +=monto
	}
	method extraer(monto){
		saldo -= monto
	}
	method saldo(){
		return saldo
	}
}
object gastos{
	var saldo=0
	var costoOperacion=20
	method depositar(monto){
		saldo =saldo+monto-costoOperacion
	}
	method extraer(monto){
		saldo -= monto
	}
	method saldo(){
		return saldo
	}
	method costoOperacion(costo){
		costoOperacion=costo
	}
}
object combinada{
	var cuentaPrimaria=gastos
	var cuentaSecundaria=corriente
	method depositar(monto){
		cuentaPrimaria.depositar(monto)
	}
	method extraer(monto){
		if (cuentaPrimaria.saldo()>=monto){
			cuentaPrimaria.extraer(monto)
		}
		else {
			cuentaSecundaria.extraer(monto)
		}
	}
	method saldo(){
		return cuentaPrimaria.saldo()+cuentaSecundaria.saldo()
	}
	method cuentaPrimaria(cuenta){
		cuentaPrimaria=cuenta
	}
	method cuentaSecundaria(cuenta){
		cuentaSecundaria=cuenta
	}
	// Aca yo no supe como idear que al setear la cuenta primaria automaticamenta la secundaria sea la otra, tampoco se si habra
}
