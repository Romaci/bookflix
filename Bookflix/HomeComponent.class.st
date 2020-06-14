"
-----------------------------------CODIGO PARA AGREGAR LIBRO---------------------------------------

""(aCanvas form)
  multipart;
  with:
    [(aCanvas label)
       for: 'upload';
       with: 'Elegir el libro a cargar'.
aCanvas break.
     (aCanvas fileUpload)
       readonly: true;
       id: 'upload';
       callback: [:f | self upload: f]].
		aCanvas submitButton text: 'Send file'.""
------------------------------------------------------------------------------------------------------		
"
Class {
	#name : #HomeComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'model',
		'file'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
HomeComponent >> initialize [ 

super initialize 
]

{ #category : #'as yet unclassified' }
HomeComponent >> irDatosPersonales [

	self call: (CuentaComponent new ).

]

{ #category : #'as yet unclassified' }
HomeComponent >> irListaDeLibros [
	self call:(ListaLibrosUserComponent new ).

]

{ #category : #accessing }
HomeComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas anchor
		callback: [ self irDatosPersonales ];
		with: [ aCanvas button with: 'Ver Datos personales' ].
	aCanvas anchor
		callback: [ self irListaDeLibros ];
		with: [ aCanvas button with: 'Ver listado de libros' ]
	
]

{ #category : #rendering }
HomeComponent >> renderLogoutButtonOn: aCanvas [

aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				"id: 'cuooter';"
				with: [ aCanvas text: 'Usuario en sesión: '.
					aCanvas paragraph: self session getUser user .
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut  ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ] ].
]

{ #category : #'as yet unclassified' }
HomeComponent >> verCuenta:unUser [

"self show: (PerfilComponent new perfilDe:unUser) "
]
