Class {
	#name : #RegistroAutorComponent,
	#superclass : #WAComponent,
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

{ #category : #hooks }
RegistroAutorComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
RegistroAutorComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: [aCanvas text: 'Bookflix'].
		

		
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
		
aCanvas horizontalRule.
]
