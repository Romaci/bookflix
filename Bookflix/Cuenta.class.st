Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'user',
		'nombre',
		'apellido',
		'mail',
		'password',
		'perfiles',
		'tarjetas'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Cuenta class >> conUser:unUser conNombre:unNombre conApellido:unApellido conMail: unMail yPass: password [ 
^self new conUser:unUser conNombre:unNombre conApellido:unApellido conMail: unMail yPass: password 
]

{ #category : #initialization }
Cuenta >> agregarPerfilConNombre: unNombre. [

	perfiles add: (Perfil conNombre:unNombre).
]

{ #category : #'as yet unclassified' }
Cuenta >> agregarTarjeta: tarjeta [
	
	tarjetas add: tarjeta.
]

{ #category : #accessing }
Cuenta >> apellido [

^apellido .
]

{ #category : #accessing }
Cuenta >> apellido:unApe [ 

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
Cuenta >> conUser:unUser conNombre:unNombre conApellido:unApellido conMail:unMail yPass:unaPass [

	
	nombre:= unNombre.
	apellido:=unApellido .
	user:=unUser .
	mail:= unMail.
	password := unaPass.
	self agregarPerfilConNombre:'Perfil 1'.
	self agregarPerfilConNombre:'Perfil 2'.
]

{ #category : #'as yet unclassified' }
Cuenta >> conUseryPassword [

	nombre:= ''.
	apellido:='' .
	user:=' ' .
	mail:= ''.
	password := ' '.

]

{ #category : #'as yet unclassified' }
Cuenta >> eliminarTarjeta: unaTarjeta [
	tarjetas remove:unaTarjeta.
]

{ #category : #'as yet unclassified' }
Cuenta >> estaRegistradaTarjeta: unNro [
	
		^tarjetas detect: [ :each | each nro = unNro ]	
		ifNone: [ nil ]
]

{ #category : #initialization }
Cuenta >> initialize [ 

	perfiles:= OrderedCollection new.
	tarjetas:= OrderedCollection new.
	
]

{ #category : #accessing }
Cuenta >> mail [

	^mail.
]

{ #category : #accessing }
Cuenta >> mail:unMail [

mail:=unMail . 
]

{ #category : #accessing }
Cuenta >> nombre [
	
 ^nombre.
]

{ #category : #accessing }
Cuenta >> nombre:unNombre [

nombre :=unNombre .
]

{ #category : #accessing }
Cuenta >> password [
^password
]

{ #category : #accessing }
Cuenta >> password: unaPass [
	password := unaPass.
]

{ #category : #accessing }
Cuenta >> tarjetas [
	^tarjetas
]

{ #category : #accessing }
Cuenta >> user [ 
^user
]

{ #category : #accessing }
Cuenta >> user: unUser [
	
	user:= unUser.
]
