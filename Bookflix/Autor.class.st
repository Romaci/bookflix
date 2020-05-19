Class {
	#name : #Autor,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'nacionalidad',
		'fechaDeNac',
		'fechaDeDef'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Autor class >> conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD [

^self new conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD.
]

{ #category : #accessing }
Autor >> apellido [

	^apellido.
]

{ #category : #'as yet unclassified' }
Autor >> conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD [
	
	nombre:= unNombre.
	apellido:= unApellido.
	fechaDeNac := unaFN.
	fechaDeDef := unaFD.


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
Autor >> nombre [

	^nombre.
]

{ #category : #'as yet unclassified' }
Autor >> nombreYapellido [

|aux|
^aux:=nombre+apellido
]
