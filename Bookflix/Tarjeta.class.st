Class {
	#name : #Tarjeta,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'nro',
		'cod',
		'expDate'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Tarjeta class >> conNombre:unNombre apellido:unApell nro:unNro cod:unCod expDate:date [

	^self new conNombre:unNombre apellido:unApell nro:unNro cod:unCod expDate:date.
]

{ #category : #accessing }
Tarjeta >> apellido [ 
	^apellido
]

{ #category : #accessing }
Tarjeta >> apellido: unApell [

	apellido:=unApell.
]

{ #category : #accessing }
Tarjeta >> cod [
	^cod.
]

{ #category : #accessing }
Tarjeta >> cod: unCod [
	cod:=unCod.
]

{ #category : #'as yet unclassified' }
Tarjeta >> conNombre:unNombre apellido:unApell nro:unNro cod:unCod expDate:date [

	nombre:= unNombre.
	apellido:= unApell.
	nro:=unNro.
	cod:= unCod.
	expDate:= date.
	
]

{ #category : #accessing }
Tarjeta >> expDate [ 
	^expDate.
]

{ #category : #accessing }
Tarjeta >> expDate: date [
	expDate:=date.
]

{ #category : #accessing }
Tarjeta >> nombre [
	^nombre
]

{ #category : #accessing }
Tarjeta >> nombre: unNombre [
		nombre:= unNombre.
]

{ #category : #accessing }
Tarjeta >> nro [
	^nro.
]

{ #category : #accessing }
Tarjeta >> nro: unNro [

	nro:= unNro.
]
