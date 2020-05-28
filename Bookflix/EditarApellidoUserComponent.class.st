Class {
	#name : #EditarApellidoUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'apellido',
		'model',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarApellidoUserComponent >> apellido:unApe [

apellido:=unApe.
]

{ #category : #'as yet unclassified' }
EditarApellidoUserComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
EditarApellidoUserComponent >> guardar [
self isValid
		ifFalse: [ ^ self ]
		ifTrue:[
	self session getUser apellido: apellido.

	self answer]
]

{ #category : #initialization }
EditarApellidoUserComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
]

{ #category : #validating }
EditarApellidoUserComponent >> isValid [
    errorMessage removeAll.
	self verificarApellido.
	 ^ errorMessage isEmpty.
]

{ #category : #accessing }
EditarApellidoUserComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
EditarApellidoUserComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [aCanvas paragraph: [ aCanvas label: 'Apellido '.
					aCanvas textInput 
					callback: [ :valor| self apellido:valor];
					with: ''.].
				
		aCanvas button
			callback: [self guardar ];
			with: 'Modificar apellido'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].
			aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] 



]

{ #category : #validating }
EditarApellidoUserComponent >> verificarApellido [

	apellido ='' ifTrue: [errorMessage add:'*El campo Apellido es requerido.'].
]
