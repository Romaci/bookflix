Class {
	#name : #EditarEditorialComponent,
	#superclass : #WAComponent,
	#instVars : [
		'editorial',
		'model',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarEditorialComponent >> editorial [ 

^editorial
]

{ #category : #accessing }
EditarEditorialComponent >> editorial:unaEditorial [

editorial:=unaEditorial.
]

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> editorialDe:unLibro [

libro:=unLibro. 
]

{ #category : #accessing }
EditarEditorialComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
				
				
				
				
		
		aCanvas 
				paragraph: [ aCanvas label: 'Editoriales: '.
					aCanvas select
						callback: [ :valor| self editorial:valor];
						list:(self model editoriales collect:[:g|g nombreEditorial]);	
					selected:self editorial;	
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Editar editorial'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarEditorialComponent >> libro [ 

^libro
]

{ #category : #accessing }
EditarEditorialComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> registrar [


     self libro editorial: self editorial . 

	self answer. 
]

{ #category : #rendering }
EditarEditorialComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #hooks }
EditarEditorialComponent >> style [
	^ ' body { font-family: arial; text-decoration: strong; padding: 5px 20px 20px 20px; }
	.panel {  padding: 40px; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24)  }
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }
	#pieDeRespuesta{text-align: center}
	#Bookflix { text-align: left; color: darkblue; font-family: arial; font-size: 60px;  } 
	#respuesta { text-align: center; }
	a {color:darkblue} 
	#logout { text-align: right; padding: 6px 14px; float: right}
	#usuario { text-align: right; padding: 6px 14px; float: left; padding: 0px; color: ForestGreen; }
	button { background-color: darkblue; border: none; color: white; padding: 10px 24px; text-align: center; text-decoration: 	none; display: inline-block; font-size: 16px; margin: 4px 2px;  border-radius: 8px; -webkit-transition-duration: 0.4s; 	transition-duration: 0.4s; cursor: pointer;}
	button:hover {background-color: black; color: white; box-shadow: 0 6px 10px 0 rgba(0,0,0,0.24), 0 17px 50px 0 	rgba(0,0,0,0.19);
	#formLogin { display: flex; flex-direction: column; align-items: center; justify-content: center;  }'
]

{ #category : #'as yet unclassified' }
EditarEditorialComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: [aCanvas text: 'Bookflix'].
		
		"aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ]."
		
aCanvas horizontalRule.
]
