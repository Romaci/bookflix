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
		.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: auto;
  border-radius: 5px;
}
	.card:hover {box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);}
	.container {
  padding: 2px 16px;
}
					
	
	.grid { display:grid; grid-template-columns:70% 30%; }
	
	.gridForm { display:grid; grid-template-columns:40% 50% 10%; padding:1.5em;border-bottom-style:solid; border-bottom-width: 1px;}
	
	.gridForm2 { display:grid; grid-template-columns:35% 40% 25%; padding:1.5em;border-bottom-style:solid; border-bottom-width: 1px;}
		.gridCards{ display:grid; grid-template-columns: 1fr 1fr 1fr 1fr; grid-column-gap: 20px;grid-row-gap: 20px;}
		
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	.titSeccion{text-aling: center, text-decoration:none, text-color: gray}
	
	.centro{display: flex; flex-direction: column; align-items: center; justify-content: center;}
	.caja{
  border: 1px solid;
  border-radius: 25px;
  padding: 20px;
  margin: 10px;
  width: 60%;
display: flex; flex-direction: column;
}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19)}
		
	a:link, a:visited, a:active {
    text-decoration:none;
	color:black;
	font-style: italic;
}
	
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
		aCanvas anchor
						callback: [ self volver ];
						with: [ aCanvas button with: 'Volver' ] .
		
aCanvas horizontalRule.
	
]

{ #category : #'as yet unclassified' }
AbstractUserComponent >> volver [ 
	self answer.
]
