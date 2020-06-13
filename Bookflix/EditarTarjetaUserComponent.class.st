Class {
	#name : #EditarTarjetaUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'tarjeta',
		'tarjetaIng',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #callbacks }
EditarTarjetaUserComponent >> cancelar [
self answer.
]

{ #category : #rendering }
EditarTarjetaUserComponent >> formularioTarjeta: aCanvas [
			aCanvas heading: [ aCanvas label: 'Datos de Tarjeta' ].
			aCanvas div
				id: 'formLogin';
				with: [  aCanvas
						form:[
						aCanvas
								paragraph: [ aCanvas label: 'Nombre Titular: '.
									aCanvas textInput
										callback: [ :valor | (self tarjetaIng) nombre: valor ];
										with: (self tarjeta) nombre ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido Titular: '.
									aCanvas textInput
										callback: [ :valor | (self tarjetaIng) apellido: valor ];
										with:  (self tarjeta) apellido   ].
							aCanvas
								paragraph: [ aCanvas label: 'Número de tarjeta (debe contener 10 dígitos): '.
									aCanvas numberInput
										callback: [ :valor | (self tarjetaIng) nro: valor ];
										with: (self tarjeta) nro  ].
							aCanvas
								paragraph: [ aCanvas label: 'Código de seguridad (debe contener 3 o 4 dígitos): '.
									aCanvas numberInput
										callback: [ :valor | (self tarjetaIng) cod: valor ];
										with: (self tarjeta) cod ].
							aCanvas
								paragraph: [ aCanvas label: 'vencimiento: '.
									aCanvas monthInput
										callback: [ :valor | (self tarjetaIng) expDate:valor ];
										with: (self tarjeta) expDate].
									aCanvas
										div: [ aCanvas button
												callback: [ self modificar ];
												with: 'Modificar' ].
									aCanvas div
										with: [ aCanvas button
												callback: [ self cancelar ];
												with: 'Cancelar'  ] ] ]  
]

{ #category : #initialization }
EditarTarjetaUserComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
	tarjetaIng := Tarjeta new. 
	tarjeta:= Tarjeta new.
]

{ #category : #validations }
EditarTarjetaUserComponent >> isValid [
    errorMessage removeAll.
		self verificarNombTit.
		self verificarApellTit.
		self verificarNroTarjeta.
		self verificarCodSeg.
		self verificarDateExp.
     ^ errorMessage isEmpty.

]

{ #category : #callbacks }
EditarTarjetaUserComponent >> modificar [
	self isValid
		ifFalse: [ ^self ]
		ifTrue: [
			(self tarjeta) nombre: ((self tarjetaIng) nombre).
			(self tarjeta) apellido: ((self tarjetaIng) apellido).
			(self tarjeta) nro: ((self tarjetaIng) nro).
			(self tarjeta) cod: ((self tarjetaIng) cod).
			(self tarjeta) expDate:  ((self tarjetaIng) expDate).
			self answer. ].
]

{ #category : #rendering }
EditarTarjetaUserComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		with: [ aCanvas div
				id: 'formLogin';
				with: [ self formularioTarjeta: aCanvas ].
			aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] ]
]

{ #category : #acccessing }
EditarTarjetaUserComponent >> tarjeta [ 
	^tarjeta
]

{ #category : #setter }
EditarTarjetaUserComponent >> tarjeta: unaTarjeta [

	tarjeta := unaTarjeta.
]

{ #category : #acccessing }
EditarTarjetaUserComponent >> tarjetaIng [ 
	^tarjetaIng.
]

{ #category : #setter }
EditarTarjetaUserComponent >> tarjetaIng: unaTarjeta [

	tarjetaIng := unaTarjeta.
]

{ #category : #validations }
EditarTarjetaUserComponent >> verificarApellTit [

	tarjetaIng apellido  ='' ifTrue: [errorMessage add:'*El campo Apellido Titular es requerido.'].
	
	
]

{ #category : #validations }
EditarTarjetaUserComponent >> verificarCodSeg [
	tarjetaIng cod = ''
		ifTrue: [ tarjetaIng cod: tarjeta cod ]
		ifFalse: [ tarjetaIng cod size > 4 | (tarjetaIng cod size < 3)
				ifTrue: [ errorMessage
						add: '*El Código de seguridad debe tener 3 o 4 dígitos.' ] ]
]

{ #category : #validations }
EditarTarjetaUserComponent >> verificarDateExp [
	| mes anio hoy dic |
	dic := Dictionary new.
	dic at: 48 put: 0.
	dic at: 49 put: 1.
	dic at: 50 put: 2.
	dic at: 51 put: 3.
	dic at: 52 put: 4.
	dic at: 53 put: 5.
	dic at: 54 put: 6.
	dic at: 55 put: 7.
	dic at: 56 put: 8.
	dic at: 57 put: 9.
	tarjetaIng expDate isEmpty
		ifTrue: [ tarjetaIng expDate: tarjeta expDate ]
		ifFalse: [ mes := (dic at: (tarjetaIng expDate at: 6) asInteger) * 10
				+ (dic at: (tarjetaIng expDate at: 7) asInteger).
			anio := (dic at: (tarjetaIng expDate at: 1) asInteger) * 1000
				+ ((dic at: (tarjetaIng expDate at: 2) asInteger) * 100)
				+ ((dic at: (tarjetaIng expDate at: 3) asInteger) * 10)
				+ (dic at: (tarjetaIng expDate at: 4) asInteger).
			hoy := DateAndTime now.
			mes < hoy month | (anio < hoy year)
				ifTrue:
					[ errorMessage add: '*La Fecha de Vencimiento ingresada no es válida' ] ]
]

{ #category : #validations }
EditarTarjetaUserComponent >> verificarNombTit [

	tarjetaIng  nombre  ='' ifTrue: [errorMessage add:'*El campo Nombre de Títular es requerido.'].
	
	
]

{ #category : #validations }
EditarTarjetaUserComponent >> verificarNroTarjeta [

	tarjetaIng nro  = '' ifTrue:[tarjetaIng nro: tarjeta nro]
	ifFalse:[tarjetaIng nro size = 10  ifFalse: [errorMessage add:'*El Número de Tarjeta debe tener 10 dígitos.'].]
	
]
