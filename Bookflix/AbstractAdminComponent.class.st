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
	#name : #AbstractAdminComponent,
	#superclass : #WAComponent,
	#instVars : [
		'successMessage',
		'errorMessage'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
AbstractAdminComponent >> errorMessage [ 
	^errorMessage 
]

{ #category : #initialization }
AbstractAdminComponent >> initialize [ 
	super initialize.
	errorMessage := OrderedCollection new.
	successMessage := false.
]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> logOut [
self show: (LoginAdminWithMoldComponent  new )
]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> logOutButton: aCanvas [
			aCanvas div
				with: [ aCanvas anchor
						callback: [ self logOut ];
						with: [ aCanvas button with: 'Cerrar sesión' ] ]
]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> mensajes: aCanvas [
		aCanvas div
		id: 'mensajeError';
		with: [ self errorMessage do: [ :each | aCanvas paragraph: each ] ].
	self successMessage ifTrue: [ 
			aCanvas div
			id:'mensajeExito';
			with:[
			aCanvas paragraph: 'El libro se registró correctamente' ]
		 ].
]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> mensajes: aCanvas de: elem [
		aCanvas div
		id: 'mensajeError';
		with: [ self errorMessage do: [ :each | aCanvas paragraph: each ] ].
	self successMessage ifTrue: [ 
			aCanvas div
			id:'mensajeExito';
			with:[
			aCanvas paragraph: elem, ' se registró correctamente' ]
		 ].
]

{ #category : #hooks }
AbstractAdminComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	
	button { background-color: darkblue; border: none; color: white; padding: 10px 24px; text-align: 	center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  	border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 	17px 50px 0 	rgba(0,0,0,0.19);}
			
			
	.card { box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s; width: 40%;}
	.card:hover {box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);}
	.container { padding: 2px 16px;}
	
	
	
	.grid { display:grid; grid-template-columns:70% 30%}
		
	a {color:red} 
	
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
		
	
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	
	#mensajeExito{color:green}
	
	#mensajeError{color:red}
	
	#pieDeRespuesta{text-align: center}
	
	#Bookflix { text-align: left; color: darkred; font-family: arial; font-size: 60px;} 
	
	#BookflixAdmin { text-align: left; color: darkblue; font-family: arial; font-size: 60px;} 
	
	#respuesta { text-align: center; }
	
	#logout { text-align: right; padding: 6px 14px; float: right}
	
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
		
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #accessing }
AbstractAdminComponent >> successMessage [ 
	^successMessage.
]

{ #category : #accessing }
AbstractAdminComponent >> successMessage: aValue [
	
	successMessage:= aValue.
	
]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> titleTop: aCanvas [
	aCanvas div
		id: 'BookflixAdmin';
		with: [ aCanvas text: 'Bookflix'.	].
			aCanvas div
		id: 'logout';
		with: [ self logOutButton: aCanvas ].
	aCanvas div
		id: 'volverButton';
		with: [ aCanvas div with: [ self volver: aCanvas ].
			aCanvas break.
			aCanvas horizontalRule ].

]

{ #category : #'as yet unclassified' }
AbstractAdminComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self answer ];
		with: [ aCanvas button with: 'Volver' ]
]
