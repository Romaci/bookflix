Class {
	#name : #BookflixSampleLoader,
	#superclass : #Object,
	#category : #'Bookflix-samples'
}

{ #category : #'as yet unclassified' }
BookflixSampleLoader >> loadExampleDataIn:unSistema [
|usuario1 admin|

usuario1:=unSistema registrarCuentaDe: 'lugosi' conNombre: 'Gato' conApellido: 'Lugosi' conMail: 'lugosi@bookflix.com'  yPass: '1234'.


admin:= unSistema registrarAdminitrador: 'lugosi' conNombre: 'Gato' conApellido: 'Lugosi' conMail: 'lugosi@bookflix.com' yPass: '1234'
]
