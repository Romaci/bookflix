Class {
	#name : #ListaLibrosComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> entrarLibro:unLibro [
	self call: ((DetalleLibroComponent  new detalleDe:unLibro )).
	(self model libros isEmpty)
	ifTrue:  [ self answer. ]
	
]

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> irRegistrarLibro [


	self call: (RegistrarLibroComponent  new ).
	"self answer ."
]

{ #category : #accessing }
ListaLibrosComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
ListaLibrosComponent >> renderContentOn: aCanvas. [

self titleTop: aCanvas.
(self model libros isEmpty)
ifTrue:  [aCanvas paragraph: 'No hay libros registrados en el sistema'  ].
aCanvas div
with:[aCanvas div
	class: 'gridCards';
	with:[ (self model obtenerListadoLibros) do:[:each| self renderLibro:each On:aCanvas]]]. 
		
	
]

{ #category : #rendering }
ListaLibrosComponent >> renderLibro:unLibro On:aCanvas [
				
	aCanvas div 
		class: 'card';
		with:[ aCanvas anchor
		callback: [ self entrarLibro: unLibro];
		with:[aCanvas image
				altText: 'Portada';
				style:'width:100%;border-radius: 5px 5px 0 0';
				url: LBFileLibrary /'portada.jpg'.
				aCanvas div
				class:'container';
				with:[
					aCanvas paragraph
					style:'font-weight: bold';
					with: unLibro titulo.
					aCanvas paragraph 
					style: 'font-style: italic';
					with:unLibro autor nombreYapellido .
					]]].
		
				
				
									
			"	aCanvas text: 'Titulo del libro:  '. aCanvas anchor callback: [ '' ];  with: [ aCanvas text: unLibro titulo,' '].  
				aCanvas text: 'Autor:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro autor asString ].
	aCanvas text: 'Editorial:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro editorial asString ].  
				aCanvas text: 'Género:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro genero asString ].  
	aCanvas 
	heading: [ aCanvas anchor
						callback: [ self entrarLibro:unLibro ];
						with: [aCanvas text: 'Modificar datos del libro' ].]."


		
]

{ #category : #rendering }
ListaLibrosComponent >> renderLogoutButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Cerrar Sesión' ]].
]

{ #category : #rendering }
ListaLibrosComponent >> renderVolverButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ]].
]
