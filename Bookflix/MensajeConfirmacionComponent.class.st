Class {
	#name : #MensajeConfirmacionComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
MensajeConfirmacionComponent >> cancelar [
self call:((DetalleLibroComponent new)detalleDe:  self libro). 
self answer .
]

{ #category : #initialization }
MensajeConfirmacionComponent >> initialize [ 

super initialize.
libro:= Libro new.
]

{ #category : #'as yet unclassified' }
MensajeConfirmacionComponent >> irEliminar [

	self model eliminarLibro: self libro.
	self call:ListaLibrosComponent new . 
	self answer.
]

{ #category : #accessing }
MensajeConfirmacionComponent >> libro [ 
	^libro
]

{ #category : #accessing }
MensajeConfirmacionComponent >> libro: unLibro [

	libro:= unLibro
]

{ #category : #accessing }
MensajeConfirmacionComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #rendering }
MensajeConfirmacionComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas form 
	with:[
	aCanvas div
		with: [aCanvas paragraph:'¿Está seguro que quiere eliminar el libro ', self libro titulo, '?' 
			 ].
	aCanvas button
		callback: [ self irEliminar];
		with: 'Confirmar'.					
	aCanvas button
		callback: [ self cancelar];
		with: 'Cancelar'.]
]
