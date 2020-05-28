Class {
	#name : #DetalleLibroComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> detalleDe:unLibro [

libro:=unLibro . 
]

{ #category : #initialization }
DetalleLibroComponent >> initialize [
	super initialize. 
]

{ #category : #accessing }
DetalleLibroComponent >> libro [

^libro
]

{ #category : #accessing }
DetalleLibroComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarAutor:unLibro [

self call: (EditarAutorComponent new autorDe:unLibro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarEditorial [

self call: (EditarEditorialComponent new editorialDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarGenero [

self call: (EditarGeneroComponent new generoDe:libro ).


]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarTitulo [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarTitulo:unLibro [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #rendering }
DetalleLibroComponent >> renderContentOn: aCanvas [

	self titleTop: aCanvas.

	aCanvas break.
	aCanvas div
	id:'centrar';
	with:[
	self renderLibro: libro on: aCanvas]
]

{ #category : #rendering }
DetalleLibroComponent >> renderLibro: unLibro on: aCanvas [
	aCanvas heading level: 2; with: unLibro titulo asString.
		aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarTitulo   ];
		with: [ aCanvas button with: 'Modificar título' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas text: ''.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro autor asString   ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarAutor:unLibro   ];
		with: [ aCanvas button with: 'Modificar autor' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas break.
			aCanvas text: ''.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro editorial  asString  ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarEditorial  ];
		with: [ aCanvas button with: 'Modificar Editorial' ].
	aCanvas horizontalRule.
		aCanvas break.
			aCanvas text: ''.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro genero  asString  ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarGenero   ];
		with: [ aCanvas button with: 'Modificar género' ].
	aCanvas horizontalRule.
		aCanvas break.
	
	
	aCanvas break.

	"aCanvas 
		paragraph: [aCanvas  text: ' | Cantidad de likes: ' , unaPreg cantidadLikes printString .
					aCanvas  text: ' | Cantidad de dislikes: ' , unaPreg cantidadDislikes printString.]."
	
	"aCanvas 
	paragraph: [ aCanvas  anchor 
							callback: [unaPreg registrarVotoDe: self session getUser valor: true ];
							with: 'Like / '. 
							aCanvas  anchor 
							callback: [unaPreg registrarVotoDe: self session getUser valor: false ];
							with: 'Dislike'].				
			aCanvas anchor
				callback: [ self respuesta: unaPreg ];
				with: [ aCanvas button
						id: 'respuesta';
						with: 'Responder' ].
	aCanvas horizontalRule.
	aCanvas break.
	aCanvas heading level: 2; with: [aCanvas text: 'Respuestas'].
	aCanvas table: [ pregunta getRespuestas  do: [ :each | self renderRespuestas: each on: aCanvas ] ].
	aCanvas div
		id: 'pieDeRespuesta';
		with: 'No hay mas respuestas.'"
]
