Class {
	#name : #Novedad,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'autor',
		'portada',
		'sinopsis',
		'trailer'
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
