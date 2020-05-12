Class {
	#name : #Perfil,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'favoritos',
		'historial',
		'recomendados'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Perfil class >> conNombre:unNombre [ 
^self new conNombre:unNombre.
]

{ #category : #'as yet unclassified' }
Perfil >> conNombre: unNombre [

	nombre:= unNombre.
]

{ #category : #initialization }
Perfil >> initialize [
	
	favoritos:= OrderedCollection new.
	historial:= OrderedCollection new.
	recomendados:= OrderedCollection new.
]

{ #category : #accessing }
Perfil >> nombre [
	^nombre.
]

{ #category : #accessing }
Perfil >> nombre: unNombre [

	nombre:= unNombre.
]
