Class {
	#name : #ListaAutoresComponent,
	#superclass : #AbstractAdminComponent,
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
	self call: (RegistrarAutorComponent  new ).
	"self answer ."
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
aCanvas break. 
	aCanvas
		table: [  (self model obtenerListadoAutores) do:[:each| self renderAutor:each On:aCanvas]]. 
		

]
