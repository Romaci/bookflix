"
|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""


application:=WAAdmin register: LoginComponentWithMold  asApplicationAt: 'bookflix'.
application sessionClass: SessionWithUser.
WAAdmin register: HomeComponent  asApplicationAt: 'BookflixHome'.
WAAdmin register:CuentaComponent   asApplicationAt: 'Cuenta'.
WAAdmin register: RegistroComponentWithMold  asApplicationAt: 'Registro'.



""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 

"
Class {
	#name : #RegistroComponentWithMold,
	#superclass : #WAComponent,
	#instVars : [
		'cuenta',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
RegistroComponentWithMold >> buildMold [
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
RegistroComponentWithMold >> cuenta [
	^cuenta.
]

{ #category : #'as yet unclassified' }
RegistroComponentWithMold >> formularioRegistro: aCanvas [

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
RegistroComponentWithMold >> initialize [
	super initialize. 
	cuenta:= Cuenta new.
	self buildMold.
]

{ #category : #'as yet unclassified' }
RegistroComponentWithMold >> irRegistroExitoso [
	self call: RegistroExitosoComponent new.
]

{ #category : #accessing }
RegistroComponentWithMold >> model [
^ SistemaBookflix soleInstance
]

{ #category : #'as yet unclassified' }
RegistroComponentWithMold >> registrar [

  mold isValid ifFalse: [^self].
  mold save.
(self model estaRegistradoUsuario: cuenta user )
		ifNil: [ self model registrarCuentaDe: cuenta user conNombre: cuenta nombre conApellido: cuenta apellido conMail: cuenta mail  yPass: cuenta password.
		self irRegistroExitoso.	].
		self answer.
  
]

{ #category : #rendering }
RegistroComponentWithMold >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
		

	
 
]

{ #category : #hooks }
RegistroComponentWithMold >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	#respuesta { text-align: center; }
	a {color:red} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
RegistroComponentWithMold >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
