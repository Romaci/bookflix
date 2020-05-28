Class {
	#name : #EditarEditorialComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'editorial',
		'model',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarEditorialComponent >> editorial [ 

^editorial
]

{ #category : #accessing }
EditarEditorialComponent >> editorial:unaEditorial [

editorial:=unaEditorial.
]

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> editorialDe:unLibro [

libro:=unLibro. 
]

{ #category : #accessing }
EditarEditorialComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
				
				
				
				
		
		aCanvas 
				paragraph: [ aCanvas label: 'Editoriales: '.
					aCanvas select
						callback: [ :valor| self editorial:valor];
						list:(self model editoriales collect:[:g|g nombreEditorial]);	
					selected:self editorial;	
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Modificar editorial'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarEditorialComponent >> libro [ 

^libro
]

{ #category : #accessing }
EditarEditorialComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> registrar [


     self libro editorial: self editorial . 

	self answer. 
]

{ #category : #rendering }
EditarEditorialComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]
