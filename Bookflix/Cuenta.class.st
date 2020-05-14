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
Cuenta class >> conNombre:unNombre mail: unMail yPass: unaPass [ 
^self new conNombre:unNombre mail: unMail yPass: unaPass.
]

{ #category : #initialization }
Cuenta >> agregarPerfilConNombre: unNombre [.

	perfiles add: (Perfil conNombre:unNombre).
]

{ #category : #'as yet unclassified' }
Cuenta >> conUser:unUser conNombre:unNombre conApellido:unApellido mail:unMail yPass:unaPass [

	
	nombre:= unNombre.
	apellido:=unApellido .
	user:=unUser .
	mail:= unMail.
	password := unaPass.
	self agregarPerfilConNombre:'Perfil 1'.
	self agregarPerfilConNombre:'Perfil 2'.
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
Cuenta >> user [ 
^user
]
