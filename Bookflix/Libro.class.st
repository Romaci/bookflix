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
		'comentarios',
		'isbn',
		'portada'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Libro class >> libroConTitulo: unTitulo de: unAutor editadoPor: unaEditorial genero: unGenero isbn: unIsbn [ 

^self new libroConTitulo: unTitulo de: unAutor editadoPor: unaEditorial genero: unGenero isbn: unIsbn 


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

{ #category : #accessing }
Libro >> isbn [
	^isbn.
]

{ #category : #accessing }
Libro >> isbn: unIsbn [

	isbn:= unIsbn.
]

{ #category : #'as yet unclassified' }
Libro >> libroConTitulo: unTitulo de: unAutor editadoPor: unaEditorial genero: unGenero isbn: unIsbn [ 
	titulo := unTitulo.
	autor := unAutor.
	editorial := unaEditorial.
	genero := unGenero.
	isbn := unIsbn.
]

{ #category : #accessing }
Libro >> portada [
	^portada.
]

{ #category : #accessing }
Libro >> portada: unaPortada [
	portada:= unaPortada.
]

{ #category : #accessing }
Libro >> titulo [
	
	^titulo.
]

{ #category : #accessing }
Libro >> titulo:unTitulo [

titulo:=unTitulo . 
]

{ #category : #accessing }
Libro >> trailer [

	^trailer
]

{ #category : #accessing }
Libro >> trailer: unTrailer [

	trailer:= unTrailer.
]
