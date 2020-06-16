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

{ #category : #'as yet unclassified' }
HomeComponent >> enderNovedad:unaNovedad On:aCanvas [
				
	aCanvas div 
		class: 'card';
		with:[ aCanvas anchor
		callback: [ self entrarNovedad:  unaNovedad];
		with:[aCanvas image
				altText: 'Portada';
				style:'width:100%;border-radius: 5px 5px 0 0';
				url: LBFileLibrary /'portada.jpg'.
				aCanvas div
				class:'container';
				with:[
					aCanvas paragraph
					style:'font-weight: bold';
					with: unaNovedad titulo.
					aCanvas paragraph 
					style: 'font-style: italic';
					with:unaNovedad autor.
					]]].
		
]

{ #category : #'as yet unclassified' }
HomeComponent >> entrarNovedad:unaNovedad [
	self call: ((DetalleNovedadUserComponent new) novedad: unaNovedad).

]

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
		with: [ aCanvas button with: 'Ver listado de libros' ].
		(self model novedades isEmpty)
ifTrue:  [aCanvas paragraph: 'No hay Novedades registradas en el sistema'  ].
aCanvas paragraph: 'NOVEDADES' .
aCanvas div
with:[aCanvas div
	class: 'gridCards';
	with:[ (self model novedades) do:[:each| self renderNovedad:each On:aCanvas]]]. 
	
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
HomeComponent >> renderNovedad:unaNovedad On:aCanvas [
				
	aCanvas div 
		class: 'card';
		with:[ aCanvas anchor
		callback: [ self entrarNovedad:  unaNovedad];
		with:[aCanvas image
				altText: 'Portada';
				style:'width:100%;border-radius: 5px 5px 0 0';
				url: LBFileLibrary /'portada.jpg'.
				aCanvas div
				class:'container';
				with:[
					aCanvas paragraph
					style:'font-weight: bold';
					with: unaNovedad titulo.
					aCanvas paragraph 
					style: 'font-style: italic';
					with:unaNovedad autor.
					]]].
		
]

{ #category : #'as yet unclassified' }
HomeComponent >> titleTop: aCanvas [
	
	aCanvas div 
	class:'grid';
	with: [ 
		aCanvas div 
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
		aCanvas div
		id: 'logout';
		with: [self logOutButton: aCanvas  ].
		 
		].

aCanvas horizontalRule.
]

{ #category : #'as yet unclassified' }
HomeComponent >> verCuenta:unUser [

"self show: (PerfilComponent new perfilDe:unUser) "
]
