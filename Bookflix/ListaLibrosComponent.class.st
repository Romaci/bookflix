Class {
	#name : #ListaLibrosComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> entrarLibro [


	self call: (DetalleLibroComponent  new ).
	"self answer ."
]

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> entrarLibro:unLibro [


	self call: (DetalleLibroComponent  new detalleDe:unLibro ).
	"self answer ."
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
	aCanvas
		table: [(self model obtenerListadoLibros) do:[:each| self renderLibro:each On:aCanvas]]. 
		
	
]

{ #category : #rendering }
ListaLibrosComponent >> renderLibro:unLibro On:aCanvas [

aCanvas horizontalRule.

"aCanvas 
	heading: [ aCanvas anchor
						callback: [ self irDetalleAutor:unaPreg ];
						with: [aCanvas text: unaPreg getTitulo asString ].].
					aCanvas 
	paragraph: [ aCanvas text: unaPreg getTexto]."
	

									
				aCanvas text: 'Titulo del libro:  '. aCanvas anchor callback: [ '' ];  with: [ aCanvas text: unLibro titulo,' '].  
				aCanvas text: 'Autor:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro autor asString ].
	aCanvas text: 'Editorial:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro editorial asString ].  
				aCanvas text: 'Género:  '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro genero asString ].  
	aCanvas 
	heading: [ aCanvas anchor
						callback: [ self entrarLibro:unLibro ];
						with: [aCanvas text: 'Modificar datos del libro' ].].


		
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
