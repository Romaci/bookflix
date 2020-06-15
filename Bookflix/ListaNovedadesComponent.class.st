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
	self call: ((DetalleNovedadComponent  new detalleDe:unaNovedad )).
	(self model obtenerListadoNovedades isEmpty)
	ifTrue:  [ self answer. ]
]

{ #category : #'as yet unclassified' }
ListaNovedadesComponent >> irRegistrarNovedad [
	self call: (CargarNovedadComponent   new ).
	"self answer ."
]

{ #category : #accessing }
ListaNovedadesComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
ListaNovedadesComponent >> renderContentOn: aCanvas. [
self titleTop: aCanvas.
aCanvas break. 
	aCanvas
		table: [  (self model obtenerListadoNovedades do:[:each| self renderNovedad:each On:aCanvas])]. 
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
		callback: [ self entrarNovedad: unaNovedad];
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
					aCanvas paragraph 
					
					]]].
]

{ #category : #rendering }
ListaNovedadesComponent >> renderVolverButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Volver' ]].
]
