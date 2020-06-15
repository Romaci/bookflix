Class {
	#name : #DetalleNovedadComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'novedad',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> detalleDe:unaNovedad [

novedad:=unaNovedad . 
]

{ #category : #initialization }
DetalleNovedadComponent >> initialize [
	super initialize. 
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> irEliminarNovedad [
	"self call:( (MensajeConfirmacionNovedadComponent  new ) novedad: self novedad ).
	self answer
	
"
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> irModificarNovedad [


"self call:( (ModificarNovedadComponent  new )novedad: self novedad )."	
]

{ #category : #accessing }
DetalleNovedadComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> modificarAutor:unaNovedad [

"self call: (EditarAutorComponent new autorDe:unLibro)."
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> modificarTitulo [

"self call: (EditarTituloComponent new tituloDe:libro)."
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> modificarTitulo:unaNovedad [

"self call: (EditarTituloComponent new tituloDe:libro)."
]

{ #category : #accessing }
DetalleNovedadComponent >> novedad [
^novedad
]

{ #category : #'as yet unclassified' }
DetalleNovedadComponent >> publicar [

novedad publicada ifFalse:[] 
]

{ #category : #rendering }
DetalleNovedadComponent >> renderContentOn: aCanvas [

	self titleTop: aCanvas.

	aCanvas break.
	aCanvas div
	id:'centrar';
	with:[
	self renderNovedad: novedad on: aCanvas].
]

{ #category : #rendering }
DetalleNovedadComponent >> renderNovedad: unaNovedad on: aCanvas [
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
						with:unaNovedad titulo.
						aCanvas paragraph
						style: 'margin-top:1px
						';
						with:'por ',unaNovedad autor.
						aCanvas paragraph
						
						].
			   aCanvas div
					   with:[aCanvas div
							with: [ aCanvas anchor
								callback: [ self irModificarNovedad];
								with: [ aCanvas text: 'Modificar' ].
							aCanvas text: ' | '.
							aCanvas anchor
								callback: [ self irEliminarNovedad ];
								with: [ aCanvas text: 'Eliminar' ] ]].].
				(unaNovedad sinopsis =' ')
					ifTrue: [
						aCanvas div
							style:'padding: 1.5em;';
							with:[ 
						aCanvas heading
							style:'font-size:20px';
							with:'Sinopsis'.
							aCanvas paragraph: unaNovedad sinopsis ]
						 ]. 
		 
]
