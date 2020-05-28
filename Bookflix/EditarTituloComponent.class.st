Class {
	#name : #EditarTituloComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'model',
		'titulo',
		'libro',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarTituloComponent >> cancelar [
self answer 
]

{ #category : #accessing }
EditarTituloComponent >> formularioRegistro:aCanvas [


aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Título'.
					aCanvas textInput 
						callback: [ :valor| self titulo:valor];
					with: ''.].
			

		aCanvas button
			callback: [self guardar ];
			with: 'Modificar título'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
			aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] 
]

{ #category : #'as yet unclassified' }
EditarTituloComponent >> guardar [
	self isValid
		ifFalse: [ ^ self ]
		ifTrue:[	self libro titulo: titulo. 

	self answer]

	

]

{ #category : #initialization }
EditarTituloComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
]

{ #category : #validating }
EditarTituloComponent >> isValid [
    errorMessage removeAll.
    self verificarNombre.
    ^ errorMessage isEmpty.
]

{ #category : #accessing }
EditarTituloComponent >> libro [

^libro
]

{ #category : #accessing }
EditarTituloComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
EditarTituloComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]



]

{ #category : #accessing }
EditarTituloComponent >> titulo:unTitulo [

titulo:=unTitulo .
]

{ #category : #'as yet unclassified' }
EditarTituloComponent >> tituloDe:unLibro [

libro:=unLibro. 
]

{ #category : #validating }
EditarTituloComponent >> verificarNombre [

	titulo ='' ifTrue: [errorMessage add:'*El campo Título es requerido.'].
]
