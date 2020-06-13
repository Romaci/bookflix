Class {
	#name : #RegistrarTarjetaUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'tarjeta',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #callbacks }
RegistrarTarjetaUserComponent >> cancelar [
self answer.
]

{ #category : #rendering }
RegistrarTarjetaUserComponent >> formularioTarjeta: aCanvas [
			aCanvas heading: [ aCanvas label: 'Datos de Tarjeta' ].
			aCanvas div
				id: 'formLogin';
				with: [  aCanvas
						form:[
						aCanvas
								paragraph: [ aCanvas label: 'Nombre Titular: '.
									aCanvas textInput
										callback: [ :valor | (self tarjeta) nombre: valor ];
										with: (self tarjeta) nombre ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido Titular: '.
									aCanvas textInput
										callback: [ :valor | (self tarjeta) apellido: valor ];
										with:  (self tarjeta) apellido   ].
							aCanvas
								paragraph: [ aCanvas label: 'Número de tarjeta (debe contener 10 dígitos): '.
									aCanvas numberInput
										callback: [ :valor | (self tarjeta) nro: valor ];
										with: (self tarjeta) nro  ].
							aCanvas
								paragraph: [ aCanvas label: 'Código de seguridad (debe contener 3 o 4 dígitos): '.
									aCanvas numberInput
										callback: [ :valor | (self tarjeta) cod: valor ];
										with: (self tarjeta) cod ].
							aCanvas
								paragraph: [ aCanvas label: 'Vencimiento: '.
									aCanvas monthInput
										callback: [ :valor | (self tarjeta) expDate:valor ];
										with: (self tarjeta) expDate].
									aCanvas
										div: [ aCanvas button
												callback: [ self modificar ];
												with: 'Guardar' ].
									aCanvas div
										with: [ aCanvas button
												callback: [ self cancelar ];
												with: 'Cancelar'  ] ] ]  
]

{ #category : #initialization }
RegistrarTarjetaUserComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
	tarjeta:= Tarjeta new.
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> isValid [
    errorMessage removeAll.
		self verificarNombTit.
		self verificarApellTit.
		self verificarNroTarjeta.
		self verificarCodSeg.
		self verificarDateExp.
     ^ errorMessage isEmpty.

]

{ #category : #callbacks }
RegistrarTarjetaUserComponent >> modificar [
	self isValid
		ifFalse: [ ^self ]
		ifTrue: [
			self session getUser agregarTarjeta: self tarjeta.
			self answer. ].
]

{ #category : #rendering }
RegistrarTarjetaUserComponent >> renderContentOn: aCanvas [
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
RegistrarTarjetaUserComponent >> tarjeta [ 
	^tarjeta
]

{ #category : #setter }
RegistrarTarjetaUserComponent >> tarjeta: unaTarjeta [

	tarjeta := unaTarjeta.
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> verificarApellTit [

	tarjeta apellido  ='' ifTrue: [errorMessage add:'*El campo Apellido Titular es requerido.'].
	
	
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> verificarCodSeg [
	tarjeta cod = ''
		ifTrue: [ errorMessage add: '*El campo Código de Seguridad es requerido.' ]
		ifFalse: [ tarjeta cod size > 4 | (tarjeta cod size < 3)
				ifTrue: [ errorMessage
						add: '*El Código de seguridad debe tener 3 o 4 dígitos.' ] ]
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> verificarDateExp [
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
	tarjeta expDate isEmpty
		ifTrue: [ errorMessage add: '*El campo Fecha de Vencimiento es requerido.' ]
		ifFalse: [ mes := (dic at: (tarjeta expDate at: 6) asInteger) * 10
				+ (dic at: (tarjeta expDate at: 7) asInteger).
			anio := (dic at: (tarjeta expDate at: 1) asInteger) * 1000
				+ ((dic at: (tarjeta expDate at: 2) asInteger) * 100)
				+ ((dic at: (tarjeta expDate at: 3) asInteger) * 10)
				+ (dic at: (tarjeta expDate at: 4) asInteger).
			hoy := DateAndTime now.
			mes < hoy month | (anio < hoy year)
				ifTrue:
					[ errorMessage add: '*La Fecha de Vencimiento ingresada no es válida' ] ]
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> verificarNombTit [

	tarjeta  nombre  ='' ifTrue: [errorMessage add:'*El campo Nombre de Títular es requerido.'].
	
	
]

{ #category : #validations }
RegistrarTarjetaUserComponent >> verificarNroTarjeta [

	tarjeta nro  = '' ifTrue:[errorMessage add:'*El campo Número de tarjeta  es requerido.']
	ifFalse:[tarjeta nro size = 10  ifFalse: [errorMessage add:'*El Número de Tarjeta debe tener 10 dígitos.'].]
	
]
