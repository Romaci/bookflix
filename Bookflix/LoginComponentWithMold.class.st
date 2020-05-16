"
|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""


application:=WAAdmin register: LoginComponentWithMold  asApplicationAt: 'bookflix'.
application sessionClass: SessionWithUser.
WAAdmin register: HomeComponent  asApplicationAt: 'BookflixHome'.
WAAdmin register:CuentaComponent   asApplicationAt: 'Cuenta'.
WAAdmin register: RegistroComponent  asApplicationAt: 'Registro'.



""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 




"
Class {
	#name : #LoginComponentWithMold,
	#superclass : #WAComponent,
	#instVars : [
		'userName',
		'password',
		'mold'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
LoginComponentWithMold >> buildMold [
mold := Mold new.
  (mold stringField)
    label: 'Username:';
    beRequired.
  (mold passwordField)
	
    label: 'Password:';
   
    beRequired. 
]

{ #category : #'as yet unclassified' }
LoginComponentWithMold >> formularioLogin:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with:[
aCanvas form:
    [mold canvas: aCanvas.
    mold paragraphs.
    (aCanvas submitButton)
      callback: [self login];
      value: 'Save']]]
"aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		with: [ aCanvas form: [aCanvas 
				paragraph: [ aCanvas label: 'Nombre de usuario: '.
					aCanvas textInput 
						callback: [ :valor| self setUser:valor];
					with: ''.].
			
	
			aCanvas paragraph: [ aCanvas label: 'Password: '.
					aCanvas passwordInput
					callback: [ :valor| self setPassword:valor];
					with: ''.].
 
	
		aCanvas button
			callback: [self login ];
			with: 'Iniciar sesión'.
		
		
		aCanvas button
			callback: [self irRegistro ];
			with: 'Registrarse'.].
		]. ].


"
]

{ #category : #initialization }
LoginComponentWithMold >> initialize [
	super initialize. 
	self buildMold
]

{ #category : #'as yet unclassified' }
LoginComponentWithMold >> irHome: aUser [

self session setUser:aUser.

self call: HomeComponent new.

]

{ #category : #'as yet unclassified' }
LoginComponentWithMold >> irRegistro [ 
   self call: RegistroComponent new.
]

{ #category : #'private protocol' }
LoginComponentWithMold >> login [ 
(self model withUsername:userName ypass:password)
		ifNotNil: [ :it | self irHome:it ].
	userName:= nil.
	password := nil
]

{ #category : #accessing }
LoginComponentWithMold >> model [
^ SistemaBookflix soleInstance
]

{ #category : #rendering }
LoginComponentWithMold >> renderContentOn: aCanvas [
self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioLogin: aCanvas ]
		

	
 
]

{ #category : #initialization }
LoginComponentWithMold >> setPassword:unaPass [
password :=unaPass. 
]

{ #category : #'as yet unclassified' }
LoginComponentWithMold >> setUser: unUser [
userName:= unUser.
]

{ #category : #hooks }
LoginComponentWithMold >> style [
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
LoginComponentWithMold >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: 'Bookflix'
]
