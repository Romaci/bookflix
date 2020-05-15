Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'autor',
		'editorial',
		'genero',
		'trailer',
		'puntuacion',
		'comentarios'
	],
	#category : #'Bookflix-model'
}

{ #category : #accessing }
Libro >> titulo [
	
	^titulo.
]
