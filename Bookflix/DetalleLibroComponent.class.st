Class {
	#name : #DetalleLibroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> detalleDe:unLibro [

libro:=unLibro . 
]

{ #category : #initialization }
DetalleLibroComponent >> initialize [
	super initialize. 
]

{ #category : #accessing }
DetalleLibroComponent >> libro [

^libro
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> logOut [
self show: (LoginWithMoldComponent  new )
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> logOutButton: aCanvas [
"aCanvas div
		id: 'contLogout';
		with: [aCanvas div
				id: 'cuooter';
				with: [ aCanvas text: 'Usuario en sesión: '.
					aCanvas anchor
						callback: [ self verPerfil: self session getUser ];
						with: [ aCanvas text: self session getUser getNombreUser  ] ]."
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ]
]

{ #category : #accessing }
DetalleLibroComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarAutor:unLibro [

self call: (EditarAutorComponent new autorDe:unLibro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarEditorial [

self call: (EditarEditorialComponent new editorialDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarGenero [

self call: (EditarGeneroComponent new generoDe:libro ).


]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarTitulo [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> modificarTitulo:unLibro [

self call: (EditarTituloComponent new tituloDe:libro).
]

{ #category : #rendering }
DetalleLibroComponent >> renderContentOn: aCanvas [

	self titleTop: aCanvas.

	aCanvas break.
	self renderLibro: libro on: aCanvas
]

{ #category : #rendering }
DetalleLibroComponent >> renderLibro: unLibro on: aCanvas [
	aCanvas heading level: 2; with: unLibro titulo asString.
		aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarTitulo   ];
		with: [ aCanvas button with: 'Modificar título' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas text: 'Autor'.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro autor asString   ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarAutor:unLibro   ];
		with: [ aCanvas button with: 'Modificar autor' ].
	aCanvas horizontalRule.
		aCanvas break.
	aCanvas break.
			aCanvas text: 'Editorial'.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro editorial  asString  ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarEditorial  ];
		with: [ aCanvas button with: 'Modificar Editorial' ].
	aCanvas horizontalRule.
		aCanvas break.
			aCanvas text: 'Genero'.
	aCanvas anchor
		callback: [   ];
		with: [ aCanvas text: unLibro genero  asString  ].
			aCanvas horizontalRule.
	aCanvas anchor
		callback: [ self modificarGenero   ];
		with: [ aCanvas button with: 'Modificar género' ].
	aCanvas horizontalRule.
		aCanvas break.
	
	
	aCanvas break.

	"aCanvas 
		paragraph: [aCanvas  text: ' | Cantidad de likes: ' , unaPreg cantidadLikes printString .
					aCanvas  text: ' | Cantidad de dislikes: ' , unaPreg cantidadDislikes printString.]."
	
	"aCanvas 
	paragraph: [ aCanvas  anchor 
							callback: [unaPreg registrarVotoDe: self session getUser valor: true ];
							with: 'Like / '. 
							aCanvas  anchor 
							callback: [unaPreg registrarVotoDe: self session getUser valor: false ];
							with: 'Dislike'].				
			aCanvas anchor
				callback: [ self respuesta: unaPreg ];
				with: [ aCanvas button
						id: 'respuesta';
						with: 'Responder' ].
	aCanvas horizontalRule.
	aCanvas break.
	aCanvas heading level: 2; with: [aCanvas text: 'Respuestas'].
	aCanvas table: [ pregunta getRespuestas  do: [ :each | self renderRespuestas: each on: aCanvas ] ].
	aCanvas div
		id: 'pieDeRespuesta';
		with: 'No hay mas respuestas.'"
]

{ #category : #hooks }
DetalleLibroComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	aCanvas div
		id: 'logout';
		with: [ self logOutButton: aCanvas ].
	aCanvas div
		id: 'volverButton';
		with: [ aCanvas div with: [ self volver: aCanvas ].
			aCanvas break.
			aCanvas horizontalRule ]
]

{ #category : #'as yet unclassified' }
DetalleLibroComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button with: 'Volver' ]
]
