Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'user',
		'nombre',
		'apellido',
		'mail',
		'password',
		'perfiles'
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

{ #category : #accessing }
Cuenta >> apellido [

	^apellido.
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

{ #category : #initialization }
Cuenta >> initialize [ 

	perfiles:= OrderedCollection new.
	
]

{ #category : #accessing }
Cuenta >> mail [

	^mail.
]

{ #category : #accessing }
Cuenta >> nombre [
	
 ^nombre.
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
Cuenta >> user [ 
^user
]

{ #category : #accessing }
Cuenta >> user: unUser [
	
	user:= unUser.
]
