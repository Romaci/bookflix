Class {
	#name : #ModificarAutorComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'nombre',
		'apellido',
		'fechaNac',
		'fechaDef',
		'autor'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ModificarAutorComponent >> apellido [ 
	^apellido
]

{ #category : #accessing }
ModificarAutorComponent >> apellido: unApell [
	
	apellido := unApell.
]

{ #category : #accessing }
ModificarAutorComponent >> autor [ 	
	^autor
]

{ #category : #accessing }
ModificarAutorComponent >> autor: unAutor [
	autor:=unAutor.
]

{ #category : #'as yet unclassified' }
ModificarAutorComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
ModificarAutorComponent >> fechaDeDef [ 
	
	^fechaDef.
]

{ #category : #'as yet unclassified' }
ModificarAutorComponent >> fechaDeDef: fD [
	fechaDef:= fD.
]

{ #category : #'as yet unclassified' }
ModificarAutorComponent >> fechaDeNac [ 
	^fechaNac.
]

{ #category : #'as yet unclassified' }
ModificarAutorComponent >> fechaDeNac: fN [

 fechaNac:= fN.
]

{ #category : #accessing }
ModificarAutorComponent >> formularioRegistro: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ "aCanvas button
						callback: [ self cancelar: aCanvas ];
						with: 'Cancelar' ]"
							aCanvas
								paragraph: [ aCanvas label: 'Nombre: '.
									aCanvas textInput
										callback: [ :valor | self nombre: valor ];
										with: self autor nombre ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido: '.
									aCanvas textInput
										callback: [ :valor | self apellido: valor ];
										with: self autor apellido ].
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
								with: 'Modificar autor' ] ] ]
]

{ #category : #initialization }
ModificarAutorComponent >> initialize [ 

super initialize 

]

{ #category : #validating }
ModificarAutorComponent >> isValid [
	self errorMessage removeAll.
	self successMessage: false.
	self verificarAutor.
	self verificarFN.
	^ errorMessage isEmpty
]

{ #category : #accessing }
ModificarAutorComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
ModificarAutorComponent >> nombre [
	^nombre
]

{ #category : #accessing }
ModificarAutorComponent >> nombre: unNomb [
	nombre:= unNomb.
]

{ #category : #'as yet unclassified' }
ModificarAutorComponent >> registrar [
	self isValid
		ifTrue: [ (self autor) nombre: self nombre.
					(self autor) apellido: self apellido.
					(self autor) fechaDeNac: self fechaDeNac.
					(self autor) fechaDeDef: self fechaDeDef.
					self successMessage: true.
			 ].

	^ self
]

{ #category : #rendering }
ModificarAutorComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
	self mensajes: aCanvas de: 'El Autor se modificó '
]

{ #category : #validating }
ModificarAutorComponent >> verificarAutor [ 

self apellido ='' ifTrue: [self apellido: autor apellido].
self nombre ='' ifTrue: [self nombre: autor nombre].

]

{ #category : #validating }
ModificarAutorComponent >> verificarFN [ 
self fechaDeNac > self fechaDeDef ifTrue: [ errorMessage add:'*La Fecha de Defunción no puede ser anterior a la de nacimiento']
]
