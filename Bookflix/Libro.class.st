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

{ #category : #'as yet unclassified' }
Libro class >> registrarLibroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unaListaDeGeneros [

^self new libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unaListaDeGeneros
]

{ #category : #'as yet unclassified' }
Libro >> initilize [

genero:= OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
Libro >> libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unaListaDeGeneros [

titulo:=unTitulo . 
autor:=unAutor . 
editorial :=unaEditorial .
genero :=unaListaDeGeneros . 
]

{ #category : #accessing }
Libro >> titulo [
	
	^titulo.
]
