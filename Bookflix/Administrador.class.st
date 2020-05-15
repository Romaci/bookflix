Class {
	#name : #Administrador,
	#superclass : #Object,
	#instVars : [
		'user',
		'nombre',
		'apellido',
		'mail',
		'password'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Administrador class >> conNombre:unNombre apellido: unApellido mail: unMail yPassword: unaPass [

^self new conNombre:unNombre apellido: unApellido mail: unMail yPassWord: unaPass.
]

{ #category : #'as yet unclassified' }
Administrador >> conNombre:unNombre apellido: unApellido mail: unMail yPassWord: unaPass. [

	nombre:= unNombre.
	apellido:= unApellido.
	mail:= unMail.
	password := unaPass.
]
