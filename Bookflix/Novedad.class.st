Class {
	#name : #Novedad,
	#superclass : #Object,
	#instVars : [
		'imagen',
		'nombreClave'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
Novedad class >> imagen:unaImagen [

^self new imagen:unaImagen. 
]

{ #category : #'as yet unclassified' }
Novedad class >> imagen:unaImagen clave:unaClave [

^self new imagen:unaImagen nombreClave: unaClave. 
]

{ #category : #accessing }
Novedad >> imagen [

^imagen
]

{ #category : #accessing }
Novedad >> imagen:unaImagen [

imagen:=unaImagen. 
]

{ #category : #'as yet unclassified' }
Novedad >> imagen:unaImagen nombreClave:unNombre [

imagen:=unaImagen .

nombreClave :=unNombre . 
]

{ #category : #accessing }
Novedad >> nombreClave [

^nombreClave 
]

{ #category : #accessing }
Novedad >> nombreClave:unNombre [

nombreClave := unNombre 
]
