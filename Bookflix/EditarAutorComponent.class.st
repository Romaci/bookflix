Class {
	#name : #EditarAutorComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'autor',
		'model',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarAutorComponent >> autor [

^autor
]

{ #category : #accessing }
EditarAutorComponent >> autor:unAutor [

autor:=unAutor. 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> autorDe:unLibro [

libro:=unLibro 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarAutorComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
				
		
		aCanvas 
				paragraph: [ aCanvas label: 'Autores: '.
					aCanvas select
						callback: [ :valor| self autor:valor];
						list:(self model autores collect:[:g|g nombre    ]);	
					selected:self autor;	
					with: ''.].
 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Modificar autor'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarAutorComponent >> libro [

^libro
]

{ #category : #accessing }
EditarAutorComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> registrar [


     self libro autor: self autor . 

	self answer. 
]

{ #category : #rendering }
EditarAutorComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]
