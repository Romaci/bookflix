Class {
	#name : #Cuenta,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'mail',
		'password',
		'perfiles',
		'nroTarjeta',
		'codSeg',
		'dateExp',
		'titular'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Cuenta class >> conMail:unMail Pass: unaPass nombre: unNombre nroTarjeta: unNro codSeg:unCod dateExp: unaFecha titular:unTit [
^self new conMail:unMail Pass: unaPass nombre: unNombre nroTarjeta: unNro codSeg:unCod dateExp: unaFecha titular:unTit.
]

{ #category : #'as yet unclassified' }
Cuenta class >> conNombre:unNombre Nombre: unMail ypass: unaPass [ 
^self new conNombre:unNombre Nombre: unMail ypass: unaPass.
]

{ #category : #'as yet unclassified' }
Cuenta >> conNombre:unNombre Nombre: unMail ypass: unaPass [
	
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
