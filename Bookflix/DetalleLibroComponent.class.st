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

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> irEliminarLibro [ 
	self call:( (MensajeConfirmacionComponent  new ) libro: self libro ).
	self answer
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> irModificarLibro [


	self call:( (ModificarLibroComponent  new ) libro: self libro ).
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
	self renderLibro: libro on: aCanvas].
]

{ #category : #rendering }
DetalleLibroComponent >> renderLibro: unLibro on: aCanvas [
	aCanvas div
		class: 'gridForm2';
		style: 'border-bottom-width: 0px;';
		with: [ aCanvas div
				with: [ aCanvas image
						altText: 'Portada';
						style: 'width:100%;border-radius: 5px 5px 0 0';
						url: LBFileLibrary / 'portada.jpg' ].
				aCanvas div
					with: [ aCanvas heading
						style:'font-size:20px; margin-bottom:0px';
						with:unLibro titulo.
						aCanvas paragraph
						style: 'margin-top:1px
						';
						with:'por ',unLibro autor.
						aCanvas paragraph
						style:'background-color: rgba(0,0,0,.3); border: 5px solid transparent; border-radius: 2px; 				display: inline-block;font-size: 1em;margin: 0 5px 5px auto;';
						with:unLibro genero.
						aCanvas paragraph:'Editorial: ', unLibro editorial.
						aCanvas paragraph:'ISBN: ', unLibro isbn.
						].
			   aCanvas div
					   with:[aCanvas div
							with: [ aCanvas anchor
								callback: [ self irModificarLibro];
								with: [ aCanvas text: 'Modificar' ].
							aCanvas text: ' | '.
							aCanvas anchor
								callback: [ self irEliminarLibro ];
								with: [ aCanvas text: 'Eliminar' ] ]].].
				(unLibro sinopsis =' ')
					ifTrue: [
						aCanvas div
							style:'padding: 1.5em;';
							with:[ 
						aCanvas heading
							style:'font-size:20px';
							with:'Sinopsis'.
							aCanvas paragraph: unLibro sinopsis ]
						 ]. 
		 
]
