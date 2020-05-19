Class {
	#name : #Editorial,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'Bookflix-model'
}

{ #category : #accessing }
Editorial class >> nombre:unNombre [

^self new nombre: unNombre
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
