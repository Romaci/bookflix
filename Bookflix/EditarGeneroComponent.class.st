Class {
	#name : #EditarGeneroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'genero',
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

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

self libro genero: self genero. 

self answer. 


]

{ #category : #rendering }
EditarGeneroComponent >> renderContentOn:aCanvas [

	aCanvas 
				paragraph: [ aCanvas label: 'Generos: '.
					aCanvas select
						callback: [ :valor| self genero:valor];
						list:(self model generos collect:[:g|g nombreGenero]);	
					selected:self genero;	
					with: ''.
				
				aCanvas button
			callback: [self registrar  ];
			with: 'Guardar género'.].
	
]
