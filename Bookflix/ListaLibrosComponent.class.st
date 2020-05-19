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
		table: [  (self model obtenerListadoLibros) do:[:each| self renderLibro:each On:aCanvas]]. 
		
	
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
				aCanvas text: 'Autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro autor nombre ].  
				aCanvas text: 'Editorial '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro editorial].  
				aCanvas text: 'Género '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unLibro autor nombre ].  
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

{ #category : #hooks }
ListaLibrosComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	#mostrarRespuesta { padding: 5px 10px; font-size: 10px; margin: 4px 2px; }
	a {color: red; text-decoration: none } 
	#cuooter { color: LightGreen}
	#contLogout { display: flex; flex-flow: row; align-items: center; align-content: center ; justify-content: flex-end; }
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: darkred; }
	
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
			'
]

{ #category : #'as yet unclassified' }
ListaLibrosComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
		
aCanvas horizontalRule.

aCanvas 
	heading: [ aCanvas anchor
						callback: [ self irRegistrarLibro ];
						with: [aCanvas text: 'Registrar nuevo libro en el sistema' ].].
]
