Class {
	#name : #ListaNovedadesComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
ListaNovedadesComponent >> entrarNovedad:unaNovedad [
	self call: ((DetalleNovedadComponent  new) novedad: unaNovedad).
	(self model novedades  isEmpty)
	ifTrue:  [ self answer. ]
	
]

{ #category : #'as yet unclassified' }
ListaNovedadesComponent >> irModificar: unAutor [
"FALTA IMPLEMENTAR"
]

{ #category : #'as yet unclassified' }
ListaNovedadesComponent >> irRegistrarLibro [


	self call: (RegistrarLibroComponent  new ).
	"self answer ."
]

{ #category : #accessing }
ListaNovedadesComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
ListaNovedadesComponent >> renderContentOn: aCanvas. [

self titleTop: aCanvas.
(self model novedades isEmpty)
ifTrue:  [aCanvas paragraph: 'No hay Novedades registradas en el sistema'  ].
aCanvas div
with:[aCanvas div
	class: 'gridCards';
	with:[ (self model novedades) do:[:each| self renderNovedad:each On:aCanvas]]]. 
		
	
]

{ #category : #rendering }
ListaNovedadesComponent >> renderLogoutButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Cerrar Sesión' ]].
]

{ #category : #rendering }
ListaNovedadesComponent >> renderNovedad:unaNovedad On:aCanvas [
				
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
ListaNovedadesComponent >> renderVolverButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ]].
]
