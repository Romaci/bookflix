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
	
	
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.].].
]

{ #category : #initialization }
RegistroEditorialComponent >> initialize [ 

super initialize 
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



     self model darDeAltaEditorial: self nombre. 

	self answer
]

{ #category : #rendering }
RegistroEditorialComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #rendering }
RegistroEditorialComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ "aCanvas text: 'Administrador en sesión: '.
					aCanvas paragraph: self session getUser user ."
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut. ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ] ].
]
