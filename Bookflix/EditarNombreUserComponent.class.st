Class {
	#name : #EditarNombreUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'nombre',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarNombreUserComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
EditarNombreUserComponent >> guardar [

self isValid
		ifFalse: [ ^ self ]
		ifTrue:[
	self session getUser nombre: nombre.

	self answer]
]

{ #category : #initialization }
EditarNombreUserComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
]

{ #category : #validating }
EditarNombreUserComponent >> isValid [
    errorMessage removeAll.
	self verificarNombre.
	 ^ errorMessage isEmpty.
]

{ #category : #accessing }
EditarNombreUserComponent >> nombre:unNombre [

nombre:=unNombre . 
]

{ #category : #rendering }
EditarNombreUserComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre'.
					aCanvas textInput 
						callback: [ :valor| self nombre:valor];
					with: ''.].
			

		aCanvas button
			callback: [self guardar ];
			with: 'Modificar nombre'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
			aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] 






]

{ #category : #validating }
EditarNombreUserComponent >> verificarNombre [

	nombre ='' ifTrue: [errorMessage add:'*El campo Nombre es requerido.'].

]
