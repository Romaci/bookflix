Class {
	#name : #Novedad,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'autor',
		'portada',
		'sinopsis',
		'trailer',
		'publicada',
		'nombreClave'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Novedad class >> titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis unNombreClave:nombreClave [

^self new titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis unNombreClave:nombreClave
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
Novedad >> nombreClave [ 
^nombreClave
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
Novedad >> publicada [
^publicada
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
Novedad >> titulo: unTitulo autor: unAutor portada: unaPortada sinopsis: unaSinopsis unNombreClave: unNombreClave [

	titulo:= unTitulo.
	autor:= unAutor.
	portada:= unaPortada.
	sinopsis:= unaSinopsis.
	publicada:=false.
	nombreClave:=unNombreClave
]

{ #category : #accessing }
Novedad >> trailer [
	^trailer.
]

{ #category : #accessing }
Novedad >> trailer: unTrailer [
	
	trailer:= unTrailer.
]
