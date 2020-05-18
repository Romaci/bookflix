Class {
	#name : #ListaLibrosComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> irRegistrarLibro [


	self call: (RegistrarLibroComponent  new ).
	self answer .

]

{ #category : #accessing }
ListaLibrosComponent >> model [ 
^ SistemaBookflix  soleInstance 
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
	

									
				aCanvas text: 'Titulo del libro '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro titulo   ].  
				aCanvas text: 'Autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro autor nombre].  
				aCanvas text: 'Editorial '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro editorial ].
	
				  
				  
	





]

{ #category : #rendering }
ListaLibrosComponent >> renderLibrosOn: aCanvas. [


	aCanvas
		table: [  (self model obtenerListadoLibros) do:[:each| self renderLibro:each On:aCanvas]]. 
		
	
]

{ #category : #rendering }
ListaLibrosComponent >> renderLogoutButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Cerrar Sesión' ]].
]

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'CuOOra';
		with: [ aCanvas text: 'Bookflix' ].
		
			aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self irRegistrarLibro];
				with: [ aCanvas button with: 'Registrar nuevo libro en el sistema' ]].
	
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
	
	
]
