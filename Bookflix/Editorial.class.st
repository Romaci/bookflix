Class {
	#name : #Editorial,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'libros'
	],
	#category : #'Bookflix-model'
}

{ #category : #accessing }
Editorial class >> nombre:unNombre [

^self new nombre: unNombre
]

{ #category : #'as yet unclassified' }
Editorial >> agregarLibro: unLibro [
	libros add:unLibro
]

{ #category : #'as yet unclassified' }
Editorial >> eliminarLibro:unLibro [
	libros remove: unLibro.
]

{ #category : #accessing }
Editorial >> libros [
	^libros
]

{ #category : #accessing }
Editorial >> nombre [
	^nombre
]

{ #category : #accessing }
Editorial >> nombre:unNombre [

nombre:=unNombre 
]

{ #category : #'as yet unclassified' }
Editorial >> nombreEditorial [

^nombre. 




]

{ #category : #'as yet unclassified' }
Editorial >> nombreEditorial:unNombre [

nombre:=unNombre. 
]
