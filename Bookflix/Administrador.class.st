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
Administrador class >> conUser:unUser conNombre:unNombre conApellido:unApellido conMail:unMail yPass:unaPass [

^self new conUser:unUser conNombre:unNombre conApellido:unApellido conMail:unMail yPass:unaPass.
]

{ #category : #accessing }
Administrador >> apellido [ 

^apellido.
]

{ #category : #'as yet unclassified' }
Administrador >> conNombre:unNombre apellido: unApellido mail: unMail yPassWord: unaPass. [

	nombre:= unNombre.
	apellido:= unApellido.
	mail:= unMail.
	password := unaPass.
]

{ #category : #'as yet unclassified' }
Administrador >> conUser:unUser conNombre:unNombre conApellido:unApellido conMail:unMail yPass:unaPass [
	
	user:= unUser.
	nombre:= unNombre.
	apellido:= unApellido.
	mail:= unMail.
	password := unaPass.
]

{ #category : #accessing }
Administrador >> mail [ 

^mail.
]

{ #category : #accessing }
Administrador >> nombre [ 

^nombre.
]

{ #category : #accessing }
Administrador >> password [

	^password.
]

{ #category : #accessing }
Administrador >> password: unaPass [
	password := unaPass.
]

{ #category : #accessing }
Administrador >> user [ 
	^user.
]

{ #category : #accessing }
Administrador >> user: unUser [
	
	user:= unUser.
]
