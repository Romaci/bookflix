Class {
	#name : #RegistroEditorialComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model',
		'nombre'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
RegistroEditorialComponent >> cancelar [
self answer 
]

{ #category : #accessing }
RegistroEditorialComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre de la editorial: '.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
				
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrar Editorial'.].
	
	
		"aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'."].].
]

{ #category : #initialization }
RegistroEditorialComponent >> initialize [ 

super initialize 
]

{ #category : #validating }
RegistroEditorialComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarEditorial.
     ^ self errorMessage isEmpty.
]

{ #category : #accessing }
RegistroEditorialComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
RegistroEditorialComponent >> nombre [ 
^nombre
]

{ #category : #accessing }
RegistroEditorialComponent >> nombre:unNombre [

nombre:=unNombre .
]

{ #category : #'as yet unclassified' }
RegistroEditorialComponent >> registrar [
	self isValid
		ifTrue: [ self model darDeAltaEditorial: self nombre.
			self successMessage: true ].
	self nombre: nil.
	^ self
]

{ #category : #rendering }
RegistroEditorialComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
		self mensajes: aCanvas de:'La Editorial se registró '
]

{ #category : #validating }
RegistroEditorialComponent >> verificarEditorial [
	
	self nombre ='' ifTrue: [self errorMessage add:'*El campo Editorial es requerido.']
	ifFalse:[
	(self model estaRegistradoEditorial: self nombre)
		ifNotNil: [ self errorMessage
				add: '*La editorial ',self nombre,' ya se encuentra registrada en el sistema'.
			]]
]
