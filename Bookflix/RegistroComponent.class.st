Class {
	#name : #RegistroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model',
		'mail',
		'nombre',
		'apellido',
		'user',
		'password',
		'password2',
		'nombTit',
		'apellTit',
		'nroTarjeta',
		'dateExp',
		'codSeg',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
RegistroComponent >> formularioRegistro: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Nombre: '.
									aCanvas textInput
										callback: [ :valor | self setNombre: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido: '.
									aCanvas textInput
										callback: [ :valor | self setApellido: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Email: '.
									aCanvas textInput
										callback: [ :valor | self setEmail: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Nombre de usuario: '.
									aCanvas textInput
										callback: [ :valor | self setUser: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Password: '.
									aCanvas passwordInput
										callback: [ :valor | self setPassword: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Repetir Password: '.
									aCanvas passwordInput
										callback: [ :valor | self setPasswordRepetida: valor ];
										with: '' ].
						   aCanvas horizontalRule.
						   aCanvas paragraph:[aCanvas label: 'Datos de Tarjeta:'].
							aCanvas
								paragraph: [ aCanvas label: 'Nombre Titular: '.
									aCanvas textInput
										callback: [ :valor | self setNombTit: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Apellido Titular: '.
									aCanvas textInput
										callback: [ :valor | self setApellTit: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Número de tarjeta: '.
									aCanvas numberInput
										callback: [ :valor | self setNroTarjeta: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Código de seguridad: '.
									aCanvas numberInput
										callback: [ :valor | self setCodSeg: valor ];
										with: '' ].		
							aCanvas
								paragraph: [ aCanvas label: 'vencimiento: '.
									aCanvas monthInput
										callback: [ :valor | self setDateExp: valor ];
										with: ''.	
							aCanvas div:[aCanvas button
								callback: [ self registrar ];
								with: 'Registrarme' ].
							
							aCanvas button
								callback: [ self volver. ];
								with: 'Cancelar'.
							]].
							 ].
						 ]
]

{ #category : #initialization }
RegistroComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
RegistroComponent >> irLogin [


self call: LoginComponent new.


]

{ #category : #validating }
RegistroComponent >> isValid [
    errorMessage removeAll.
	(self model estaRegistradoUsuario: user)
		ifNotNil: [ errorMessage
				add: '*El Usuario Ingresado ya se encuentra registrado en el sistema'.
			].
		self verificarNombre.
		self verificarApellido.
      self verificarUser.
      self verificarPassword.
		self verificarPassword2.
		self verificarNombTit.
		self verificarApellTit.
		self verificarNroTarjeta.
		self verificarDateExp.
		self verificarCodSeg.	
     ^ errorMessage isEmpty.

]

{ #category : #accessing }
RegistroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #'as yet unclassified' }
RegistroComponent >> registrar [
	self isValid
		ifFalse: [ ^ self ]
		ifTrue: [ self model
				registrarCuentaDe: user
				conNombre: nombre
				conApellido: apellido
				conMail: mail
				yPass: password.
			self irLogin ].
	user := nil.
	password := nil.
	mail := nil.
	nombre := nil.
	apellido := nil.
	nroTarjeta := nil.
	dateExp := nil.
]

{ #category : #rendering }
RegistroComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		with: [ aCanvas div
				id: 'formLogin';
				with: [ self formularioRegistro: aCanvas ].
			aCanvas div
				id: 'mensajeError';
				with:
						[ errorMessage do: [ :each | aCanvas paragraph: each ] ] ]
]

{ #category : #initialization }
RegistroComponent >> setApellTit:unNombre [

apellTit:=unNombre . 
]

{ #category : #initialization }
RegistroComponent >> setApellido:unApe [

apellido :=unApe. 
]

{ #category : #initialization }
RegistroComponent >> setCodSeg:unNro [

codSeg:= unNro.
]

{ #category : #initialization }
RegistroComponent >> setDateExp: aDate [
	
	dateExp:=aDate.
]

{ #category : #initialization }
RegistroComponent >> setEmail:unEmail [

mail:=unEmail . 
]

{ #category : #initialization }
RegistroComponent >> setNombTit:unNombre [

nombTit:=unNombre . 
]

{ #category : #initialization }
RegistroComponent >> setNombre:unNombre [

nombre:=unNombre . 
]

{ #category : #initialization }
RegistroComponent >> setNroTarjeta:unNro [

nroTarjeta := unNro.
]

{ #category : #initialization }
RegistroComponent >> setPassword: unaPass [

password :=unaPass . 
]

{ #category : #initialization }
RegistroComponent >> setPasswordRepetida: unaPass [
	password2 := unaPass
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
	#mensajeError { text-aling:center; color:red}
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

{ #category : #validating }
RegistroComponent >> verificarApellTit [

	apellTit   ='' ifTrue: [errorMessage add:'*El campo es requerido.'].
	
	
]

{ #category : #validating }
RegistroComponent >> verificarApellido [

	apellido ='' ifTrue: [errorMessage add:'*El campo Apellido es requido.'].
]

{ #category : #validating }
RegistroComponent >> verificarCodSeg [
	codSeg = ''
		ifTrue: [ errorMessage add: '*El campo Número de Tarjeta es requerido.' ]
		ifFalse: [ codSeg size > 4 | (codSeg size < 3)
				ifTrue: [ errorMessage
						add: '*El Código de seguridad debe tener 3 o 4 dígitos.' ] ]
]

{ #category : #validating }
RegistroComponent >> verificarDateExp [
	| mes hoy |
	dateExp isEmpty
		ifTrue: [ errorMessage add: '*El campo Fecha de Vencimiento es requerido.' ]
		ifFalse: [ mes := (dateExp at: 6) asInteger * 10 + (dateExp at: 7) asInteger.
			hoy := DateAndTime now.
			mes > hoy month
				ifTrue: [ errorMessage
						add: '*La fecha de vencimiento ingresada es incorrecta.' ] ]
]

{ #category : #validating }
RegistroComponent >> verificarNombTit [

	nombTit  ='' ifTrue: [errorMessage add:'*El campo Nombre de Títular es requerido.'].
	
	
]

{ #category : #validating }
RegistroComponent >> verificarNombre [

	nombre ='' ifTrue: [errorMessage add:'*El campo Nombre es requerido.'].
	
	
]

{ #category : #validating }
RegistroComponent >> verificarNroTarjeta [

	nroTarjeta = '' ifTrue:[errorMessage add:'*El campo Número de Tarjeta es requerido.']
	ifFalse:[nroTarjeta size = 10  ifFalse: [errorMessage add:'*El Número de Tarjeta debe tener 10 dígitos.'].]
	
	
]

{ #category : #validating }
RegistroComponent >> verificarPassword [

	password size < 4 | (password size > 11) ifTrue:[errorMessage add:'*La contraseña debe entre 4 y 10 caractéres inclusive'].
	password  ='' ifTrue: [errorMessage add:'*El campo Password es requerido.'].
]

{ #category : #validating }
RegistroComponent >> verificarPassword2 [
	
	password2 = password ifFalse: [ errorMessage add:'*No coincide confirmación password con password ingresada' ].
	password2  ='' ifTrue: [errorMessage add:'*El campo Confimar Password es requerido.'].

]

{ #category : #validating }
RegistroComponent >> verificarUser [

	user ifNil: [errorMessage add:'*El campo Nombre de Usuario es requerido.'].
]

{ #category : #'as yet unclassified' }
RegistroComponent >> verificarUsuario [

	user ifNil: [errorMessage add:'*El campo apellido es requerido.'].
]

{ #category : #'as yet unclassified' }
RegistroComponent >> volver [
	user := nil.
	password := nil.
	mail := nil.
	nombre := nil.
	apellido := nil.
	nroTarjeta := nil.
	dateExp := nil.
	self answer.
]
