Class {
	#name : #EditarGeneroComponent,
	#superclass : #WAComponent,
	#instVars : [
		'genero',
		'libro',
		'model'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
EditarGeneroComponent >> formularioRegistro:aCanvas [

aCanvas horizontalRule 
		with: [aCanvas div
		id: 'formLogin';
		
		with: [ aCanvas form: [
		
		aCanvas 
				paragraph: [ aCanvas label: 'Generos: '.
					aCanvas select
						callback: [ :valor| self genero:valor];
						list:(self model generos collect:[:g|g nombreGenero]);	
					selected:self genero;	
					with: ''.].
			

 
	
		aCanvas button
			callback: [self registrar  ];
			with: 'Registrar libro'.
	
	
		aCanvas button
			callback: [self cancelar:aCanvas  ];
			with: 'Cancelar'.].].]











]

{ #category : #accessing }
EditarGeneroComponent >> genero [

^genero
]

{ #category : #accessing }
EditarGeneroComponent >> genero:unGenero [

genero:=unGenero. 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> generoDe:unLibro [

libro:=unLibro. 
]

{ #category : #initialization }
EditarGeneroComponent >> initialize [
	super initialize. 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> irDetalle [

self answer . 
]

{ #category : #accessing }
EditarGeneroComponent >> libro [ 
^libro
]

{ #category : #accessing }
EditarGeneroComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #'as yet unclassified' }
EditarGeneroComponent >> registrar [


     self libro genero: self genero . 

	self irDetalle. 
]

{ #category : #rendering }
EditarGeneroComponent >> renderContentOn:aCanvas [


self titleTop: aCanvas.
	aCanvas div
	id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ]
]

{ #category : #hooks }
EditarGeneroComponent >> style [
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
EditarGeneroComponent >> titleTop: aCanvas [
	 aCanvas div id: 'Bookflix';
		with: [aCanvas text: 'Bookflix'].
		
		"aCanvas div
		id: 'logout';
		with: [self renderLogoutButtonOn: aCanvas ]."
		
aCanvas horizontalRule.
]
