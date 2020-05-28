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
	#superclass : #AbstractAdminComponent,
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
						with: [ aCanvas button with: 'Listado de libros' ].
						
						aCanvas anchor
						callback: [ self irListaDeAutores  ];
						with: [ aCanvas button with: 'Listado de autores' ].
						
						
						 ]
]

{ #category : #rendering }
HomeAdminComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [
			aCanvas div
				with: [ aCanvas anchor
					id: 'logOutAdmin';
						callback: [ self logOut . ];
						with:'Cerrar sesión' ].]
]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix'.
				aCanvas div
		id: 'logout';
		with: [ self logOutButton: aCanvas.].
					aCanvas break.
		aCanvas horizontalRule ].


]

{ #category : #'as yet unclassified' }
HomeAdminComponent >> verCuenta:unUser [

"self show: (PerfilComponent new perfilDe:unUser) "
]
