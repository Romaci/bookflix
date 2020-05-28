Class {
	#name : #EditarEmailUserComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'email',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarEmailUserComponent >> cancelar [
self answer 
]

{ #category : #accessing }
EditarEmailUserComponent >> email [

^email
]

{ #category : #accessing }
EditarEmailUserComponent >> email:unEmail [

email:=unEmail .
]

{ #category : #'as yet unclassified' }
EditarEmailUserComponent >> guardar [

"Verificar que el mail que quiero modificar no este ya en el sistema, si no está lo guarda"
	self isValid
		ifFalse: [ ^ self ]
		ifTrue:[
 	 self session getUser mail: email.

	self answer.].
	



]

{ #category : #initialization }
EditarEmailUserComponent >> initialize [
	super initialize.
	errorMessage:= OrderedCollection new.
]

{ #category : #validating }
EditarEmailUserComponent >> isValid [
    errorMessage removeAll.
	self verificarMail.
	 ^ errorMessage isEmpty.
]

{ #category : #accessing }
EditarEmailUserComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
EditarEmailUserComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas 
	form: [
				
		  aCanvas paragraph: [ aCanvas label: 'Email'.
					aCanvas textInput  
					callback: [ :valor| self email:valor];
					with: ''.].

		aCanvas button
			callback: [self guardar ];
			with: 'Modificar email'.
		
		aCanvas button
			callback: [self cancelar ];
			with: 'Cancelar'.
		
	].

aCanvas div
				id: 'mensajeError';
				with: [ errorMessage do: [ :each | aCanvas paragraph: each ] ] 



]

{ #category : #validating }
EditarEmailUserComponent >> verificarMail [

	self email ='' ifTrue: [errorMessage add:'*El campo Email es requerido.']
	ifFalse:[
	(self model estaRegistradoEmail: email) ifNotNil: [errorMessage add:'*El email ingresado ya se encuentra registrado en el sistema.'].].
]
