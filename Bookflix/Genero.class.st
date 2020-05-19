Class {
	#name : #Genero,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'Bookflix-model'
}

{ #category : #accessing }
Genero class >> nombre:unNom [

^ self new nombre:unNom. 
]

{ #category : #accessing }
Genero >> nombre:unNombre [

nombre:=unNombre . 
]

{ #category : #'as yet unclassified' }
Genero >> nombreGenero [

^nombre 
]

{ #category : #'as yet unclassified' }
Genero >> nombreGenero:unNombre [

nombre :=unNombre. 
]
