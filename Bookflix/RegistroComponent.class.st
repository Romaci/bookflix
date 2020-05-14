Class {
	#name : #RegistroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'mail',
		'nombre',
		'apellido',
		'user',
		'password'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
RegistroComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre: '.
					aCanvas textInput 
						callback: [ :valor| self setNombre:valor];
					with: ''.].
				
			aCanvas 
				paragraph: [ aCanvas label: 'Apellido: '.
					aCanvas textInput 
						callback: [ :valor| self setApellido:valor];
					with: ''.].
				
				aCanvas 
				paragraph: [ aCanvas label: 'Email: '.
					aCanvas textInput 
						callback: [ :valor| self setEmail:valor];
					with: ''.].
		
		
		aCanvas 
				paragraph: [ aCanvas label: 'Nombre de usuario: '.
					aCanvas textInput 
						callback: [ :valor| self setUser:valor];
					with: ''.].
			
	
			aCanvas paragraph: [ aCanvas label: 'Password: '.
					aCanvas passwordInput
					callback: [ :valor| self setPassword:valor];
					with: ''.].
				
				"aCanvas paragraph: [ aCanvas label: 'Repetir Password: '.
					aCanvas passwordInput
					callback: [ :valor| self setPasswordRepetida:valor];
					with: ''.]."
 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrarme'.].]]
]

{ #category : #'as yet unclassified' }
RegistroComponent >> irLogin [


self call: LoginComponent new.


]

{ #category : #accessing }
RegistroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #'as yet unclassified' }
RegistroComponent >> registrar [

	(self model estaRegistradoUsuario: user )
		ifNil: [ self model registrarCuentaDe: user conNombre: nombre conApellido: apellido conMail: mail  yPass: password. 
			
			self irLogin].
	 "user := nil.
	password := nil"


]

{ #category : #rendering }
RegistroComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #initialization }
RegistroComponent >> setApellido:unApe [

apellido :=unApe. 
]

{ #category : #initialization }
RegistroComponent >> setEmail:unEmail [

mail:=unEmail . 
]

{ #category : #initialization }
RegistroComponent >> setNombre:unNombre [

nombre:=unNombre . 
]

{ #category : #initialization }
RegistroComponent >> setPassword: unaPass [

password :=unaPass . 
]

{ #category : #initialization }
RegistroComponent >> setPasswordRepetida:unaPass [

"acá hay que hacer un get de la password que puso eel usuario y fijarse si es igual a la repetida" 
]

{ #category : #initialization }
RegistroComponent >> setUser: unUser [

user:=unUser . 
]

{ #category : #hooks }
RegistroComponent >> style [
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
RegistroComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
