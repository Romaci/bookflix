Class {
	#name : #LoginWithMoldComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuenta',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
LoginWithMoldComponent >> buildMold [
mold := Mold new.
  (mold stringField)
    label: 'User:';
	 on: #user of: self cuenta;
    beRequired: 'El campo es requerido'.
	
  (mold passwordField)
    label: 'Password:';
	 on: #password of:self cuenta;
    beRequired: 'El campo es requerido'.
	 
]

{ #category : #accessing }
LoginWithMoldComponent >> cuenta [
	^cuenta.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> formularioLogin:aCanvas [

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


	 (aCanvas button)
      callback: [self irRegistro];
      value: 'Registrar'
]]].

]

{ #category : #initialization }
LoginWithMoldComponent >> initialize [
	super initialize. 
	cuenta:= Cuenta new.
	self buildMold.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irErrorLogin [
	self call: ErrorLoginComponent new.
]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irHome: aUser [

self session setUser:aUser.

self call: HomeComponent new.

]

{ #category : #'as yet unclassified' }
LoginWithMoldComponent >> irRegistro [ 
   self call: RegistroWithMoldComponent new.
]

{ #category : #'private protocol' }
LoginWithMoldComponent >> login [
  mold isValid ifFalse: [^self].
  mold save.
   (self model withUsername:cuenta user ypass:cuenta password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
  self answer.
 
  

"login 

(self model withUsername:cuenta user ypass:cuenta password)
		ifNotNil: [ :it | self irHome:it ]
		ifNil:[self irErrorLogin].
		
	cuenta:=Cuenta new conUser:'user' conNombre:'.' conApellido:'.' conMail:'.' yPass:'password'."  
]

{ #category : #accessing }
LoginWithMoldComponent >> model [
^ SistemaBookflix soleInstance
]

{ #category : #rendering }
LoginWithMoldComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioLogin: aCanvas ]
		

	
 
]

{ #category : #hooks }
LoginWithMoldComponent >> style [
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
LoginWithMoldComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
