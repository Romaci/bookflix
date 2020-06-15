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

{ #category : #'as yet unclassified' }
Autor >> fechaDeNac [

	^fechaDeNac. 
]

{ #category : #'as yet unclassified' }
Autor >> fechaDeNacimiento [

	^fechaDeNac. 
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
]

{ #category : #'as yet unclassified' }
Autor >> nombreYapellido [


^(nombre,apellido)
]
