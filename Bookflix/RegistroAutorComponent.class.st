Class {
	#name : #RegistroAutorComponent,
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
RegistroAutorComponent >> apellido:unApe [

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
RegistroAutorComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
RegistroAutorComponent >> fechaDeDef:unaFecha [

fechaDef :=unaFecha . 
]

{ #category : #'as yet unclassified' }
RegistroAutorComponent >> fechaDeNac: unaFecha [

fechaNac :=unaFecha. 
]

{ #category : #accessing }
RegistroAutorComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre: '.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
				
			aCanvas 
				paragraph: [ aCanvas label: 'Apellido: '.
					aCanvas textInput 
						callback: [ :valor| self apellido:valor];
					with: ''.].
				
				
				
				aCanvas 
				paragraph: [ aCanvas label: 'Fecha de nacimiento: '.
					aCanvas textInput 
						callback: [ :valor| self fechaDeNac:valor];
					with: ''.].
		
		
		aCanvas 
				paragraph: [ aCanvas label: 'Fecha de defunción: '.
					aCanvas textInput 
						callback: [ :valor| self fechaDeDef:valor];
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrar autor'.].
	
	
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.].].
]

{ #category : #initialization }
RegistroAutorComponent >> initialize [ 

super initialize 
]

{ #category : #accessing }
RegistroAutorComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
RegistroAutorComponent >> nombre:unNombre [

nombre:=unNombre .
]

{ #category : #'as yet unclassified' }
RegistroAutorComponent >> registrar [

self model darDeAltaAutor:nombre apellido: apellido fechaDeNac: fechaNac yFechaDeDef: fechaDef .
    

	self answer

]

{ #category : #rendering }
RegistroAutorComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
		
	

]

{ #category : #rendering }
RegistroAutorComponent >> renderLogoutButtonOn: aCanvas [

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
