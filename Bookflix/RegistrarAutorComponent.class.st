Class {
	#name : #RegistrarAutorComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'nombre',
		'apellido',
		'fechaNac',
		'fechaDef'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
RegistrarAutorComponent >> apellido [ 
	^apellido
]

{ #category : #accessing }
RegistrarAutorComponent >> apellido: unApell [
	
	apellido := unApell.
]

{ #category : #'as yet unclassified' }
RegistrarAutorComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
RegistrarAutorComponent >> fechaDeDef [ 
	
	^fechaDef.
]

{ #category : #'as yet unclassified' }
RegistrarAutorComponent >> fechaDeDef: fD [
	fechaDef:= fD.
]

{ #category : #'as yet unclassified' }
RegistrarAutorComponent >> fechaDeNac [ 
	^fechaNac.
]

{ #category : #'as yet unclassified' }
RegistrarAutorComponent >> fechaDeNac: fN [

 fechaNac:= fN.
]

{ #category : #accessing }
RegistrarAutorComponent >> formularioRegistro: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Nombre: '.
									aCanvas textInput
										callback: [ :valor | self nombre: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido: '.
									aCanvas textInput
										callback: [ :valor | self apellido: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Fecha de nacimiento: '.
									aCanvas dateInput
										callback: [ :valor | self fechaDeNac: valor ] ].
							aCanvas
								paragraph: [ aCanvas label: 'Fecha de defunción: '.
									aCanvas dateInput
										callback: [ :valor | self fechaDeDef: valor ] ].
							aCanvas button
								callback: [ self registrar ];
								with: 'Registrar autor' ].
					"aCanvas button
						callback: [ self cancelar: aCanvas ];
						with: 'Cancelar' ]" ] ]
]

{ #category : #initialization }
RegistrarAutorComponent >> initialize [ 

super initialize 

]

{ #category : #validating }
RegistrarAutorComponent >> isValid [
	self errorMessage removeAll.
	self successMessage: false.
	(self model
		estaRegistradoAutor: self nombre
		apellido: self apellido
		fNac: self fechaDeNac
		fDef: self fechaDeDef)
		ifNotNil: [ errorMessage
				add: '*El Autor ingresado ya se encuentra registrado en el sistema' ].
	self verificarAutor.
	^ errorMessage isEmpty
]

{ #category : #accessing }
RegistrarAutorComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
RegistrarAutorComponent >> nombre [
	^nombre
]

{ #category : #accessing }
RegistrarAutorComponent >> nombre: unNomb [
	nombre:= unNomb.
]

{ #category : #'as yet unclassified' }
RegistrarAutorComponent >> registrar [
	self isValid
		ifTrue: [ self model
				darDeAltaAutor: self nombre apellido: self apellido  fechaDeNac: self fechaDeNac  yFechaDeDef: self fechaDeDef.
			self successMessage: true ].
	self nombre: nil.
	self apellido: nil.
	self fechaDeDef: nil.
	self fechaDeNac: nil.
	^ self
]

{ #category : #rendering }
RegistrarAutorComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
	self mensajes: aCanvas de: 'El Autor'
]

{ #category : #validating }
RegistrarAutorComponent >> verificarAutor [ 
self apellido ='' ifTrue: [errorMessage add:'*El campo Apellido es requerido.'].
self nombre ='' ifTrue: [errorMessage add:'*El campo Nombre es requerido.'].


]
