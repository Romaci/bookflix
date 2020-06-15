Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'nacionalidad',
		'fechaDeNac',
		'fechaDeDef',
		'libros'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Autor class >> conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD [

^self new conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD.
]

{ #category : #'as yet unclassified' }
Autor >> agregarLibro: unLibro [
	libros add:unLibro
]

{ #category : #accessing }
Autor >> apellido [

	^apellido.
]

{ #category : #accessing }
Autor >> apellido: unApellido [
	apellido:= unApellido.
]

{ #category : #accessing }
Autor >> autor [ 
^self asString 
]

{ #category : #'as yet unclassified' }
Autor >> conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD [
	
	nombre:= unNombre.
	apellido:= unApellido.
	fechaDeNac := unaFN.
	fechaDeDef := unaFD.


]

{ #category : #'as yet unclassified' }
Autor >> eliminarLibro:unLibro [
	libros remove: unLibro.
]

{ #category : #accessing }
Autor >> fechaDeDef [
	
	^fechaDeDef.
]

{ #category : #accessing }
Autor >> fechaDeDef: unaFecha [
	fechaDeDef:= unaFecha.
]

{ #category : #'as yet unclassified' }
Autor >> fechaDeNac [

	^fechaDeNac. 
]

{ #category : #accessing }
Autor >> fechaDeNac: unaFecha [
	fechaDeNac:= unaFecha.
]

{ #category : #'as yet unclassified' }
Autor >> fechaDeNacimiento [

	^fechaDeNac. 
]

{ #category : #initialization }
Autor >> initialize [
	libros:= OrderedCollection new.
]

{ #category : #accessing }
Autor >> libros [
	^libros
]

{ #category : #accessing }
Autor >> nombre [

	^nombre.
]

{ #category : #accessing }
Autor >> nombre: unNombre [
	nombre:= unNombre
]

{ #category : #'as yet unclassified' }
Autor >> nombreYapellido [


^(nombre,' ',apellido)
]
