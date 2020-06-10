"
|application|

""--------------------------------SEASIDE REGISTRO--------------------------------------""




application:=WAAdmin register: LoginAdminWithMoldComponent asApplicationAt: 'loginAdmin'.
application:=WAAdmin register: LoginWithMoldComponent asApplicationAt: 'loginUser'.
application sessionClass: SessionWithUser.


""----------------------------------------------------------------------------------------""
SistemaBookflix clearSoleInstance .
BookflixSampleLoader new loadExampleDataIn: SistemaBookflix soleInstance . 
"
Class {
	#name : #AbstractUserComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
AbstractUserComponent >> logOut [
self show: (LoginWithMoldComponent  new )
]

{ #category : #'as yet unclassified' }
AbstractUserComponent >> logOutButton: aCanvas [
aCanvas div
		with: [aCanvas div
				with: [ aCanvas text: 'Usuario en sesión: ', self session getUser user.].
				aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ] ]
]

{ #category : #hooks }
AbstractUserComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	
	button { background-color: darkred; border: none; color: white; padding: 10px 24px; text-align: center; 	text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; 	-webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	
	.grid { display:grid; grid-template-columns:70% 30%}
	
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19)}
		
	a {color:red} 
	
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
		
	
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	
	#mensajeExito{color:green}
	
	#mensajeError{color:red}
	
	#pieDeRespuesta{text-align: center}
	
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	
	#respuesta { text-align: center; }
	
	#logout { text-align: right; padding: 6px 14px; float: right}
	
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
		
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
AbstractUserComponent >> titleTop: aCanvas [
	
	aCanvas div 
	class:'grid';
	with: [ 
		aCanvas div 
		id: 'Bookflix';
		with: [ aCanvas text: 'Bookflix' ].
	
		aCanvas div
		id: 'logout';
		with: [self logOutButton: aCanvas  ].
		 
		].
	
		
aCanvas horizontalRule.
	
]
