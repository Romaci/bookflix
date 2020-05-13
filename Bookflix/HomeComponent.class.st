Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #initialization }
HomeComponent >> initialize [ 

super initialize 
]

{ #category : #'as yet unclassified' }
HomeComponent >> logOut [ 

	self show: (LoginComponent new )
]

{ #category : #accessing }
HomeComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
		aCanvas horizontalRule.


]

{ #category : #rendering }
HomeComponent >> renderLogoutButtonOn: aCanvas [

	aCanvas
		paragraph:[ aCanvas anchor
				callback: [ self logOut ];
				with: [ aCanvas button with: 'Cerrar Sesión' ]].
]

{ #category : #hooks }
HomeComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	#mostrarRespuesta { padding: 5px 10px; font-size: 10px; margin: 4px 2px; }
	a {color: red; text-decoration: none } 
	#cuooter { color: LightGreen}
	#contLogout { display: flex; flex-flow: row; align-items: center; align-content: center ; justify-content: flex-end; }
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: darkred; }
	
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
			'
]

{ #category : #'as yet unclassified' }
HomeComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
		aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ].
	
"aCanvas heading
		level: 2;
		with: [ aCanvas text: 	'Preguntas relevantes para: '. (aCanvas anchor callback: [ self verPerfil: self session getUser ];
						with: [aCanvas text: self session getUser getNombreUser  asString ]).
		"
]

{ #category : #'as yet unclassified' }
HomeComponent >> verCuenta:unUser [

"self show: (PerfilComponent new perfilDe:unUser) "
]
