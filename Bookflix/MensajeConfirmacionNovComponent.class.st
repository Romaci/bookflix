Class {
	#name : #MensajeConfirmacionNovComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'novedad'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
MensajeConfirmacionNovComponent >> cancelar [
self call:((DetalleNovedadComponent new)novedad: novedad). 
self answer .
]

{ #category : #initialization }
MensajeConfirmacionNovComponent >> initialize [ 

super initialize.
novedad:= Novedad new.
]

{ #category : #'as yet unclassified' }
MensajeConfirmacionNovComponent >> irEliminar [

	self model eliminarNovedad: novedad.
	self call:ListaNovedadesComponent new . 
	self answer.
]

{ #category : #accessing }
MensajeConfirmacionNovComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #accessing }
MensajeConfirmacionNovComponent >> novedad [ 	
	^novedad.
]

{ #category : #accessing }
MensajeConfirmacionNovComponent >> novedad: unaNovedad [

	novedad:= unaNovedad.
]

{ #category : #rendering }
MensajeConfirmacionNovComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas form 
	with:[
	aCanvas div
		with: [aCanvas paragraph:'¿Está seguro que quiere eliminar la novedad ',  novedad titulo, '?' 
			 ].
	aCanvas button
		callback: [ self irEliminar];
		with: 'Confirmar'.					
	aCanvas button
		callback: [ self cancelar];
		with: 'Cancelar'.]
]
