Class {
	#name : #RegistroWithMoldComponent,
	#superclass : #AbstractUserComponent,
	#instVars : [
		'cuenta',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
RegistroWithMoldComponent >> buildMold [
mold := Mold new.
  (mold stringField)
    label: 'User:';
	 on: #user of: self cuenta;
    beRequired: 'El campo es requerido';
	 addCondition: [ :input | (self model estaRegistradoUsuario: input) isNil]
			labeled: 
				[ :wrong | 
				'El usuario ingresado ya se escuentra registrado en el sistema' expandMacrosWith: wrong ].
	
  (mold passwordField)
    label: 'Password:';
	 on: #password of:self cuenta;
    beRequired: 'El campo es requerido'.
	 
]

{ #category : #accessing }
RegistroWithMoldComponent >> cuenta [
	^cuenta.
]

{ #category : #'as yet unclassified' }
RegistroWithMoldComponent >> formularioRegistro: aCanvas [

	aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with:[
aCanvas form:
    [mold canvas: aCanvas.
    mold paragraphs.

	 (aCanvas button)
			callback: [self registrar  ];
			with: 'Registrar'
]]].


]

{ #category : #initialization }
RegistroWithMoldComponent >> initialize [
	super initialize. 
	cuenta:= Cuenta new.
	self buildMold.
]

{ #category : #'as yet unclassified' }
RegistroWithMoldComponent >> irRegistroExitoso [
	self call: RegistroExitosoComponent new.
]

{ #category : #accessing }
RegistroWithMoldComponent >> model [
^ SistemaBookflix soleInstance
]

{ #category : #'as yet unclassified' }
RegistroWithMoldComponent >> registrar [

  mold isValid ifFalse: [^self].
  mold save.
(self model estaRegistradoUsuario: cuenta user )
		ifNil: [ self model registrarCuentaDe: cuenta user conNombre: cuenta nombre conApellido: cuenta apellido conMail: cuenta mail  yPass: cuenta password.
		self irRegistroExitoso.	].
		self answer.
  
]

{ #category : #rendering }
RegistroWithMoldComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
		

	
 
]

{ #category : #'as yet unclassified' }
RegistroWithMoldComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'.
				aCanvas horizontalRule.
]
