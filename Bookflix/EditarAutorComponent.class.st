Class {
	#name : #EditarAutorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'autor',
		'model',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
EditarAutorComponent >> autor [

^autor
]

{ #category : #accessing }
EditarAutorComponent >> autor:unAutor [

autor:=unAutor. 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> autorDe:unLibro [

libro:=unLibro 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarAutorComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
				
		
		aCanvas 
				paragraph: [ aCanvas label: 'Autores: '.
					aCanvas select
						callback: [ :valor| self autor:valor];
						list:(self model autores collect:[:g|g nombre    ]);	
					selected:self autor;	
					with: ''.].
 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Modificar autor'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarAutorComponent >> libro [

^libro
]

{ #category : #accessing }
EditarAutorComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarAutorComponent >> registrar [


     self libro autor: self autor . 

	self answer. 
]

{ #category : #rendering }
EditarAutorComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #hooks }
EditarAutorComponent >> style [
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
EditarAutorComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: [aCanvas text: 'Bookflix'].
		
		"aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ]."
		
aCanvas horizontalRule.
]
