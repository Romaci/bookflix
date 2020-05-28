Class {
	#name : #EditarGeneroComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'genero',
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarGeneroComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
		
		aCanvas 
				paragraph: [ aCanvas label: 'Generos: '.
					aCanvas select
						callback: [ :valor| self genero:valor];
						list:(self model generos collect:[:g|g nombreGenero]);	
					selected:self genero;	
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Modificar género'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarGeneroComponent >> genero [

^genero
]

{ #category : #accessing }
EditarGeneroComponent >> genero:unGenero [

genero:=unGenero. 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> generoDe:unLibro [

libro:=unLibro. 
]

{ #category : #initialization }
EditarGeneroComponent >> initialize [
	super initialize. 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> irDetalle [

self answer . 
]

{ #category : #accessing }
EditarGeneroComponent >> libro [ 
^libro
]

{ #category : #accessing }
EditarGeneroComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> registrar [


     self libro genero: self genero . 

	self irDetalle. 
]

{ #category : #rendering }
EditarGeneroComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]
