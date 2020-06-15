Class {
	#name : #MensajeConfirmacionAutorComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model',
		'autor'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
MensajeConfirmacionAutorComponent >> autor [ 
	^autor
]

{ #category : #accessing }
MensajeConfirmacionAutorComponent >> autor: unAutor [

	autor:= unAutor
]

{ #category : #'as yet unclassified' }
MensajeConfirmacionAutorComponent >> cancelar [

self answer .
]

{ #category : #initialization }
MensajeConfirmacionAutorComponent >> initialize [ 

super initialize.
autor:= Autor new.
]

{ #category : #'as yet unclassified' }
MensajeConfirmacionAutorComponent >> irEliminar [

	autor libros do:[:each|
		self model eliminarLibro: each.
		].
	self model eliminarAutor: autor.
	self answer.
]

{ #category : #accessing }
MensajeConfirmacionAutorComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #rendering }
MensajeConfirmacionAutorComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas form 
	with:[
	aCanvas div
		with: [aCanvas paragraph:'¿Está seguro que quiere eliminar el Autor ', self autor nombreYapellido, '?' 
			 ].
	(autor libros isNotEmpty )
	ifTrue:[aCanvas paragraph:'Se eliminaran también los siguientes títulos del Autor: '.
		aCanvas unorderedList
		with:[self autor libros do:[:each|
				aCanvas listItem: each titulo.
				] 
			]


		].
	
	aCanvas button
		callback: [ self irEliminar];
		with: 'Confirmar'.					
	aCanvas button
		callback: [ self cancelar];
		with: 'Cancelar'.]
]
