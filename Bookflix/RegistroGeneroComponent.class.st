Class {
	#name : #RegistroGeneroComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model',
		'nombre'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
RegistroGeneroComponent >> cancelar [
self answer 
]

{ #category : #accessing }
RegistroGeneroComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre del género: '.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
				
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrar Género'.].
	
	
"		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'."].].
]

{ #category : #initialization }
RegistroGeneroComponent >> initialize [ 

super initialize 
]

{ #category : #testing }
RegistroGeneroComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarGenero.
     ^ self errorMessage isEmpty.
]

{ #category : #accessing }
RegistroGeneroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
RegistroGeneroComponent >> nombre [ 
^nombre
]

{ #category : #accessing }
RegistroGeneroComponent >> nombre:unNombre [

nombre:=unNombre .
]

{ #category : #'as yet unclassified' }
RegistroGeneroComponent >> registrar [
	self isValid
		ifTrue: [ self model darDeAltaGenero: self nombre.
			self successMessage: true ].
	self nombre: nil.
	^ self
   

]

{ #category : #rendering }
RegistroGeneroComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
	self mensajes: aCanvas de: 'EL Género'
]

{ #category : #rendering }
RegistroGeneroComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ "aCanvas text: 'Administrador en sesión: '.
					aCanvas paragraph: self session getUser user ."
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self answer. ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ] ].
]

{ #category : #'as yet unclassified' }
RegistroGeneroComponent >> verificarGenero [
	
	self nombre ='' ifTrue: [self errorMessage add:'*El campo Género es requerido.']
	ifFalse:[
	(self model estaRegistradoGenero: self nombre)
		ifNotNil: [ self errorMessage
				add: '*El Género ',self nombre,' ya se encuentra registrado en el sistema'.
			]]
]
