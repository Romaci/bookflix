Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'nombre',
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

{ #category : #'as yet unclassified' }
Cuenta >> conNombre:unNombre mail: unMail yPass: unaPass [
	
	nombre:= unNombre.
	mail:= unMail.
	password := unaPass.
	
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
