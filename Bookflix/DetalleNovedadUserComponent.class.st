Class {
	#name : #DetalleNovedadUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'model',
		'novedad',
		'file'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
DetalleNovedadUserComponent >> detalleDe:unaNovedad [

novedad:=unaNovedad. 
]

{ #category : #initialization }
DetalleNovedadUserComponent >> initialize [
	super initialize. 
]

{ #category : #accessing }
DetalleNovedadUserComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #accessing }
DetalleNovedadUserComponent >> novedad [

^novedad
]

{ #category : #accessing }
DetalleNovedadUserComponent >> novedad: unaNovedad [
	novedad:= unaNovedad.
]

{ #category : #rendering }
DetalleNovedadUserComponent >> renderContentOn: aCanvas [

	self titleTop: aCanvas.

	aCanvas break.
	aCanvas div
	id:'centrar';
	with:[
	self renderNovedad: novedad on: aCanvas].
]

{ #category : #rendering }
DetalleNovedadUserComponent >> renderNovedad: unaNovedad on: aCanvas [
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
						style: 'font-size:20px; margin-bottom:0px';
						with: unaNovedad titulo.
					aCanvas paragraph
						style:
							'margin-top:1px
						';
						with: 'por ' , unaNovedad autor.
					aCanvas paragraph
						style:
							'background-color: rgba(0,0,0,.3); border: 5px solid transparent; border-radius: 2px; 				display: inline-block;font-size: 1em;margin: 0 5px 5px auto;';
						with: unaNovedad genero.
					aCanvas paragraph: 'Editorial: ' , unaNovedad editorial.
					aCanvas paragraph: 'ISBN: ' , unaNovedad isbn ].
			 ].
	unaNovedad sinopsis = ''
		ifFalse: [ aCanvas div
				style: 'padding: 1.5em;';
				with: [ aCanvas heading
						style: 'font-size:20px';
						with: 'Sinopsis'.
					aCanvas paragraph: unaNovedad sinopsis ] ]
]
