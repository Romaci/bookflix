Class {
	#name : #ListaAutoresComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'apellido',
		'fechaNac',
		'fechaDef'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> cancelar [

self answer .
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> irRegistrarAutor [


	self call: (RegistroAutorComponent  new ).
	"self answer ."
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> logOut [
self show: (LoginAdminWithMoldComponent  new )
]

{ #category : #accessing }
ListaAutoresComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
ListaAutoresComponent >> renderAutor:unAutor On:aCanvas [

aCanvas horizontalRule.

"aCanvas 
	heading: [ aCanvas anchor
						callback: [ self irDetalleAutor:unaPreg ];
						with: [aCanvas text: unaPreg getTitulo asString ].].
					aCanvas 
	paragraph: [ aCanvas text: unaPreg getTexto]."
	

									
				aCanvas text: 'Nombre de autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unAutor nombre    ].  
				aCanvas text: 'Apellido de autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unAutor apellido   ].  
				aCanvas text: 'Fecha de nacimiento de autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unAutor fechaDeNac ].  
				aCanvas text: 'Fecha de defunción de autor '. aCanvas anchor callback: [ '' ]; with: [ aCanvas text: unAutor fechaDeDef ].  
	
]

{ #category : #rendering }
ListaAutoresComponent >> renderContentOn: aCanvas. [

self titleTop: aCanvas.
	aCanvas
		table: [  (self model obtenerListadoAutores) do:[:each| self renderAutor:each On:aCanvas]]. 
		

]

{ #category : #rendering }
ListaAutoresComponent >> renderLogoutButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self logOut ];
				with: [ aCanvas button with: 'Cerrar Sesión' ]].
]

{ #category : #rendering }
ListaAutoresComponent >> renderVolverButtonOn: aCanvas [


	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self volver  ];
				with: [ aCanvas button with: 'Ir a home' ]].
]

{ #category : #hooks }
ListaAutoresComponent >> style [
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
ListaAutoresComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
		
		aCanvas div
		id: 'logout';
		with: [self renderVolverButtonOn: aCanvas ].
		
			"aCanvas button
			callback: [self volver  ];
			with: 'Volver'."
		
		
aCanvas horizontalRule.

aCanvas 
	heading: [ aCanvas anchor
						callback: [ self irRegistrarAutor  ];
						with: [aCanvas text: 'Registrar nuevo libro en el sistema' ].].
]

{ #category : #'as yet unclassified' }
ListaAutoresComponent >> volver [

self show: HomeAdminComponent new.
]
