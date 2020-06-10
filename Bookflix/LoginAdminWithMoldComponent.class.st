Class {
	#name : #LoginAdminWithMoldComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'administrador',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
LoginAdminWithMoldComponent >> administrador [
	^administrador.
]

{ #category : #initialization }
LoginAdminWithMoldComponent >> buildMold [
mold := Mold new.
  (mold stringField)
    label: 'User:';
	 on: #user of: self administrador ;
    beRequired: 'El campo es requerido'.
	
  (mold passwordField)
    label: 'Password:';
	 on: #password of:self administrador;
    beRequired: 'El campo es requerido'.
	 
]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> formularioLogin:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with:[
aCanvas form:
    [mold canvas: aCanvas.
    mold paragraphs.
    (aCanvas button)
      callback: [self login];
      value: 'Iniciar sesión'.

]]].

]

{ #category : #initialization }
LoginAdminWithMoldComponent >> initialize [
	super initialize. 
	administrador:= Administrador new.
	self buildMold.
]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> irErrorLogin [
	self call: ErrorLoginAdminComponent new.
]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> irHome [

self call: HomeAdminComponent new.
self answer.
]

{ #category : #'private protocol' }
LoginAdminWithMoldComponent >> login [
"Envia los datos del admin al metodo de verificacion en sistemaBookflix, si está en la colección de administradores y los datos son correctos, inicia sesion"
  mold isValid ifFalse: [^self].
  mold save.
   (self model adminWithUsername: administrador user ypass: administrador password)
		ifNotNil: [ self irHome]
		ifNil:[self irErrorLogin].
  self answer.
 
  

"login 

(self model withUsername:cuenta user ypass:cuenta password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
		
	cuenta:=Cuenta new conUser:'user' conNombre:'.' conApellido:'.' conMail:'.' yPass:'password'."  
]

{ #category : #accessing }
LoginAdminWithMoldComponent >> model [
^ SistemaBookflix soleInstance
]

{ #category : #rendering }
LoginAdminWithMoldComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioLogin: aCanvas ]
		

	
 
]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'BookflixAdmin';
		with: [ aCanvas text: 'Bookflix' ].
		aCanvas break.
		aCanvas horizontalRule 
]
