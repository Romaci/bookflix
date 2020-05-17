"
|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""


application:=WAAdmin register: LoginAdminWithMoldComponent asApplicationAt: 'bookflixAdmin'.
application:=WAAdmin register: HomeAdminComponent  asApplicationAt: 'HomeAdmin'.


""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 
"
Class {
	#name : #LoginAdminWithMoldComponent,
	#superclass : #WAComponent,
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
	self call: ErrorLoginComponent new.
]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> irHome [

self call: HomeAdminComponent new.

]

{ #category : #'as yet unclassified' }
LoginAdminWithMoldComponent >> irHome: aUser [
self session setUser:aUser.
self call: HomeAdminComponent new.

]

{ #category : #'private protocol' }
LoginAdminWithMoldComponent >> login [
  mold isValid ifFalse: [^self].
  mold save.
   (self model withUsername:administrador user ypass:administrador password)
		ifNotNil: [self irHome]
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

{ #category : #hooks }
LoginAdminWithMoldComponent >> style [
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
LoginAdminWithMoldComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
