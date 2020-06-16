Class {
	#name : #DetalleLibroUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> detalleDe:unLibro [

libro:=unLibro . 
]

{ #category : #initialization }
DetalleLibroUserComponent >> initialize [
	super initialize. 
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> irModificarLibro [


	self call:( (ModificarLibroComponent  new ) libro: self libro ).
]

{ #category : #accessing }
DetalleLibroUserComponent >> libro [

^libro
]

{ #category : #accessing }
DetalleLibroUserComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> modificarAutor:unLibro [

self call: (EditarAutorComponent new autorDe:unLibro).
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> modificarEditorial [

self call: (EditarEditorialComponent new editorialDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> modificarGenero [

self call: (EditarGeneroComponent new generoDe:libro ).


]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> modificarTitulo [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> modificarTitulo:unLibro [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroUserComponent >> receiveFile: aFile [

libro portada: aFile .
]

{ #category : #rendering }
DetalleLibroUserComponent >> renderContentOn: aCanvas [

	self titleTop: aCanvas.

	aCanvas break.
	aCanvas div
	id:'centrar';
	with:[
	self renderLibro: libro on: aCanvas].
]

{ #category : #rendering }
DetalleLibroUserComponent >> renderLibro: unLibro on: aCanvas [
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
			   aCanvas div.
				(unLibro sinopsis =' ')
					ifTrue: [
						aCanvas div
							style:'padding: 1.5em;';
							with:[ 
						aCanvas heading
							style:'font-size:20px';
							with:'Sinopsis'.
							aCanvas paragraph: unLibro sinopsis ]
						 ]. ]
]
