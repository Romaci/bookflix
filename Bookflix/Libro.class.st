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
Libro class >> conTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unGenero [

^self new libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unGenero



]

{ #category : #accessing }
Libro >> autor [

^autor
]

{ #category : #accessing }
Libro >> autor:unAutor [

autor:=unAutor.
]

{ #category : #accessing }
Libro >> editorial [

^editorial
]

{ #category : #accessing }
Libro >> editorial:unaEditorial [
editorial:=unaEditorial . 
]

{ #category : #accessing }
Libro >> genero [

^genero
]

{ #category : #'as yet unclassified' }
Libro >> genero:unGenero [

genero:=unGenero.
]

{ #category : #'as yet unclassified' }
Libro >> initilize [

"generos:= OrderedCollection new. "
]

{ #category : #'as yet unclassified' }
Libro >> libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial genero:unGenero [

titulo:=unTitulo . 
autor:=unAutor . 
editorial :=unaEditorial .
genero :=unGenero . 
]

{ #category : #accessing }
Libro >> titulo [
	
	^titulo.
]

{ #category : #accessing }
Libro >> titulo:unTitulo [

titulo:=unTitulo . 
]
