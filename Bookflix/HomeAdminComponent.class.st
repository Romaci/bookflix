"
|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""


application:=WAAdmin register: LoginAdminWithMoldComponent asApplicationAt: 'bookflixAdmin'.
application:=WAAdmin register: HomeAdminComponent  asApplicationAt: 'HomeAdmin'.
application sessionClass: SessionWithUser.

""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 
"
Class {
	#name : #HomeAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
HomeAdminComponent >> initialize [ 

super initialize 
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irCargarNovedad [


	self call: (CargarNovedadComponent new ).
	"self answer ."
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irDatosPersonales [

	self call: (CuentaComponent new ).
	self answer.
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irListaDeAutores [


	self call: (ListaAutoresComponent new ).
	self answer .
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irListaDeLibros [


	self call: (ListaLibrosComponent new ).
	self answer .
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irRegistrarAutor [


	self call: (RegistroAutorComponent  new ).
	"self answer ."
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irRegistrarEditorial [


	self call: (RegistroEditorialComponent  new ).
	"self answer ."

]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irRegistrarGenero [


	self call: (RegistroGeneroComponent  new ).
	"self answer ."
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> irRegistrarLibro [


	self call: (RegistrarLibroComponent  new ).
	"self answer ."

]

{ #category : #accessing }
HomeAdminComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
HomeAdminComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
		aCanvas div
				with: [ aCanvas anchor
						callback: [ self irRegistrarEditorial ];
						with: [ aCanvas button with: 'Dar de alta Editorial' ].
						
						aCanvas anchor
						callback: [ self irRegistrarAutor ];
						with: [ aCanvas button with: 'Dar de alta Autor' ].
						
						aCanvas anchor
						callback: [ self irRegistrarGenero ];
						with: [ aCanvas button with: 'Dar de alta Genero' ].
						
						aCanvas anchor
						callback: [ self irRegistrarLibro  ];
						with: [ aCanvas button with: 'Dar de alta Libro' ].
						
						aCanvas break. 
						
						aCanvas anchor
						callback: [ self irCargarNovedad  ];
						with: [ aCanvas button with: 'Cargar Novedad' ].
						
						aCanvas break. 
						
						aCanvas anchor
						callback: [ self irListaDeLibros  ];
						with: [ aCanvas button with: 'Listado completo de libros en sistema' ].
						
						aCanvas anchor
						callback: [ self irListaDeAutores  ];
						with: [ aCanvas button with: 'Listado completo de autores en sistema' ].
						
						
						 ]
]

{ #category : #rendering }
HomeAdminComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ 
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self answer. ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ] ].
]

{ #category : #hooks }
HomeAdminComponent >> style [
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
HomeAdminComponent >> titleTop: aCanvas [
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

{ #category : #'as yet unclassified' }
HomeAdminComponent >> verCuenta:unUser [

"self show: (PerfilComponent new perfilDe:unUser) "
]
