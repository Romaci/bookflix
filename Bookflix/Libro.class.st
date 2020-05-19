Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'autor',
		'editorial',
		'generos',
		'trailer',
		'puntuacion',
		'comentarios'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Libro class >> conTitulo:unTitulo de:unAutor editadoPor:unaEditorial generos:unaListaDeGeneros [

^self new libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial generos:unaListaDeGeneros



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
Libro >> generos [

^generos
]

{ #category : #'as yet unclassified' }
Libro >> generos:unaLista [

generos:=unaLista.
]

{ #category : #'as yet unclassified' }
Libro >> initilize [

generos:= OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
Libro >> libroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial generos:unaListaDeGeneros [

titulo:=unTitulo . 
autor:=unAutor . 
editorial :=unaEditorial .
generos :=unaListaDeGeneros . 
]

{ #category : #accessing }
Libro >> titulo [
	
	^titulo.
]

{ #category : #accessing }
Libro >> titulo:unTitulo [

titulo:=unTitulo . 
]
