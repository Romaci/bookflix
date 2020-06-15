Class {
	#name : #Novedad,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'autor',
		'genero',
		'editorial',
		'portada',
		'sinopsis',
		'trailer',
		'fechaDePublicacion',
		'isbn'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Novedad class >> titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis trailer: unTrailer [

^self new titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis trailer: unTrailer.
]

{ #category : #accessing }
Novedad >> autor [
	
	^autor.
]

{ #category : #accessing }
Novedad >> autor: unAutor [
	
	autor:= unAutor.
]

{ #category : #accessing }
Novedad >> editorial [ 
	^editorial
]

{ #category : #accessing }
Novedad >> editorial: unaEditorial [
	editorial := unaEditorial 
]

{ #category : #accessing }
Novedad >> fechaDePublicacion [ 
	^fechaDePublicacion 
]

{ #category : #accessing }
Novedad >> fechaDePublicacion: unaFecha [
	fechaDePublicacion :=unaFecha.
]

{ #category : #accessing }
Novedad >> genero [ 	
	^genero 
]

{ #category : #accessing }
Novedad >> genero: unGenero [
	genero:= unGenero.
]

{ #category : #accessing }
Novedad >> isbn [ 
	^isbn
]

{ #category : #accessing }
Novedad >> isbn: unIsbn [
	isbn:= unIsbn 
]

{ #category : #accessing }
Novedad >> portada [
	
	^portada.
]

{ #category : #accessing }
Novedad >> portada: unaPortada [
	portada :=unaPortada.
]

{ #category : #accessing }
Novedad >> sinopsis [
	^sinopsis.
]

{ #category : #accessing }
Novedad >> sinopsis: unaSinopsis [

	sinopsis:= unaSinopsis.
]

{ #category : #accessing }
Novedad >> titulo [
	
	^titulo.
]

{ #category : #accessing }
Novedad >> titulo: unTitulo [

	titulo:=unTitulo.
]

{ #category : #'as yet unclassified' }
Novedad >> titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis trailer: unTrailer [

	titulo:= unTitulo.
	autor:= unAutor.
	portada:= unaPortada.
	sinopsis:= unaSinopsis.
	trailer:= unTrailer.
]

{ #category : #accessing }
Novedad >> trailer [
	^trailer.
]

{ #category : #accessing }
Novedad >> trailer: unTrailer [
	
	trailer:= unTrailer.
]
